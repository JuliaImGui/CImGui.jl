const TestRef = Union{String, Int}

"""
$(TYPEDEF)

This is a reference to a `ImGuiTestContext`. It cannot be created directly,
instead the context will be passed to the `GuiFunc` and `TestFunc` functions of
an [`ImGuiTest`](@ref).

!!! danger
    This a memory-unsafe type, only use it while the engine is alive.
"""
const TestContext = CxxPtr{lib.ImGuiTestContext}

const _current_test_context = ScopedValue(TestContext(C_NULL))

function _generate_imcheck(expr, source, with_return, kwargs...)
    file = string(source.file)
    line = source.line

    expr_string = string(expr)
    return_expr = with_return ? :(!(result isa Test.Pass) && return) : :()

    jltest = [kw.args[2] for kw in kwargs if kw.args[1] == :jltest]
    if isempty(jltest) && !isempty(kwargs)
        throw(ArgumentError("Unsupported arguments to @imcheck: $(kwargs...)"))
    end
    jltest = isempty(jltest) ? true : only(jltest)

    quote
        local success = if $jltest
            local ts = Test.get_testset()
            local source = LineNumberNode($line, $file)
            local result
            try
                value = $(esc(expr))
                if !(value isa Bool)
                    result = Test.Error(:test_nonbool, $expr_string, value, nothing, source)
                elseif value
                    result = Test.Pass(:test, $expr_string, nothing, nothing, source)
                else
                    result = Test.Fail(:test, $expr_string, nothing, nothing, nothing, source, false)
                end
            catch ex
                result = Test.Error(:test_error, $expr_string, nothing, current_exceptions(), source)
            end

            Test.record(ts, result)

            result isa Test.Pass
        else
            Bool($(esc(expr)))
        end

        # Ignore the output because we don't support breaking out to a debugger
        # for now.
        lib.ImGuiTestEngine_Check($file, "", $line, lib.ImGuiTestCheckFlags_None, success, $expr_string)
        if $with_return && !success
            return
        end
    end
end

"""
    @imcheck expr

A port of the upstream `IM_CHECK()` macro. Like the upstream macro, this will
return early from the calling function if `expr` evaluates to `false`. Prefer
using it over `@test` because it will register test results with the test
engine, which can be convenient if you're using the built-in test engine window
(see [`ShowTestEngineWindows()`](@ref)).

`@imcheck` hooks into `@testset`'s by default, so a failure will be recorded
with your Julia `Test` tests as well as with the test engine. If this is not
wanted it can be disabled by passing `jltest=false`.

!!! note
    A limitation of the current implementation is that nicely parsing the
    expression, e.g. to display both arguments of an equality, is not
    supported.

# Examples
```julia
engine = te.CreateContext()
@register_test(engine, "foo", "bar") do ctx
    # This record the result with `Test` as well as the test engine
    @imcheck false

    # This will only record the result with the test engine
    @imcheck false jltest=false
end
```
"""
macro imcheck(expr, kwargs...)
    return _generate_imcheck(expr, __source__, true, kwargs...)
end

"""
    @imcheck_noret expr

Same as [`@imcheck`](@ref), except that it will not return early from the
calling function.
"""
macro imcheck_noret(expr, kwargs...)
    return _generate_imcheck(expr, __source__, false, kwargs...)
end

macro _default_ctx()
    quote
        if isnothing(ctx)
            ctx = _current_test_context[]
        end
    end |> esc
end

"""
$(TYPEDSIGNATURES)

Set the current reference. For more information on references see the [upstream
documentation](https://github.com/ocornut/imgui_test_engine/wiki/Named-References).

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    SetRef("My Window")
end
```

Note that `test_ref` is *always* treated as an absolute reference:
```julia
@register_test(engine, "foo", "bar") do ctx
    SetRef("My Window/quux") # This will set the reference to `//My Window/quux`

    # These two calls will not work
    SetRef("My Window") # Set the reference to `//My Window`
    SetRef("quux")      # Try to set the reference to `//quux`
end
```
"""
function SetRef(test_ref::TestRef, ctx=nothing)
    @_default_ctx
    lib.SetRef(ctx, lib.ImGuiTestRef(test_ref))
end

"""
$(TYPEDSIGNATURES)

Same as [`SetRef(::TestRef)`](@ref), except it takes an explicit window to set a
reference to.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    window = GetWindowByRef("Window")
    SetRef(window)
end
```
"""
function SetRef(window::Ptr{libig.ImGuiWindow}, ctx=nothing)
    @_default_ctx
    lib.SetRef(ctx, Ptr{Cvoid}(window))
end

"""
$(TYPEDSIGNATURES)

Get the current reference, with `id` and `path` properties.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    x = GetRef()
    @show x.id x.path
end
```
"""
function GetRef(ctx=nothing)
    @_default_ctx
    ref = lib.GetRef(ctx)
    path = lib.Path(ref)
    path_str = path == C_NULL ? nothing : unsafe_string(path)

    (; id=lib.ID(ref), path=path_str)
end

"""
$(TYPEDSIGNATURES)

Simulate a click on the reference.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    ItemClick("My button")
end
```
"""
function ItemClick(test_ref::TestRef, button::ig.ImGuiMouseButton_ = ig.ImGuiMouseButton_Left, ctx=nothing)
    @_default_ctx
    lib.ItemClick(ctx, lib.ImGuiTestRef(test_ref), Int(button))
end

"""
$(TYPEDSIGNATURES)

Ensure an item is opened.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    ItemOpen("My menu")
end
```
"""
function ItemOpen(test_ref::TestRef, flags=0, ctx=nothing)
    @_default_ctx
    lib.ItemOpen(ctx, lib.ImGuiTestRef(test_ref), Int(flags))
end

"""
$(TYPEDSIGNATURES)

Ensure an item is closed.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    ItemClose("My menu")
end
```
"""
function ItemClose(test_ref::TestRef, flags=0, ctx=nothing)
    @_default_ctx
    lib.ItemClose(ctx, lib.ImGuiTestRef(test_ref), Int(flags))
end


"""
$(TYPEDSIGNATURES)

Simulate a double-click on the reference.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    ItemDoubleClick("My selectable")
end
```
"""
function ItemDoubleClick(test_ref::TestRef, ctx=nothing)
    @_default_ctx
    lib.ItemDoubleClick(ctx, lib.ImGuiTestRef(test_ref))
end

"""
$(TYPEDSIGNATURES)

Check an item.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    ItemCheck("My checkbox")
end
```
"""
function ItemCheck(test_ref::TestRef, ctx=nothing)
    @_default_ctx
    lib.ItemCheck(ctx, lib.ImGuiTestRef(test_ref))
end

"""
$(TYPEDSIGNATURES)

Click on a menu item.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    MenuClick("My menu")
end
```
"""
function MenuClick(test_ref::TestRef, ctx=nothing)
    @_default_ctx
    lib.MenuClick(ctx, lib.ImGuiTestRef(test_ref))
end

"""
$(TYPEDSIGNATURES)

Click on a combo box item.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    ComboClick("My combo/Item 1")
end
```
"""
function ComboClick(test_ref::TestRef, ctx=nothing)
    @_default_ctx
    lib.ComboClick(ctx, lib.ImGuiTestRef(test_ref))
end

"""
$(TYPEDSIGNATURES)

Click on all items in a combo box.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    ComboClickAll("My combo")
end
```
"""
function ComboClickAll(test_ref::TestRef, ctx=nothing)
    @_default_ctx
    lib.ComboClickAll(ctx, lib.ImGuiTestRef(test_ref))
end

"""
$(TYPEDSIGNATURES)

Move the mouse to `test_ref`.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    MouseMove("My button")
end
```
"""
function MouseMove(test_ref::TestRef, ctx=nothing)
    @_default_ctx
    lib.MouseMove(ctx, lib.ImGuiTestRef(test_ref))
end

"""
$(TYPEDSIGNATURES)

Register a click of `button`.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    MouseClick()                          # LMB
    MouseClick(ig.ImGuiMouseButton_Right) # RMB
end
```
"""
function MouseClick(button::ig.ImGuiMouseButton_ = ig.ImGuiMouseButton_Left, ctx=nothing)
    @_default_ctx
    lib.MouseClick(ctx, Int(button))
end

"""
$(TYPEDSIGNATURES)

Retrieve a `ImGuiWindow` by reference. This will return `nothing` if the window
was not found.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    window_ptr = GetWindowByRef("My window")
    @show window_ptr
end
```
"""
function GetWindowByRef(test_ref::TestRef, ctx=nothing)
    @_default_ctx
    ptr = lib.GetWindowByRef(ctx, lib.ImGuiTestRef(test_ref))
    return ptr == C_NULL ? nothing : Ptr{libig.ImGuiWindow}(ptr)
end

"""
$(TYPEDSIGNATURES)

Yield to the application renderloop for `count` number of frames (defaults to
1). This is useful if you need to wait for more frames to be drawn for some
action to occur (e.g. waiting for a window to appear after checking a
checkbox).
"""
function Yield(count::Int=1, ctx=nothing)
    @_default_ctx
    lib.Yield(ctx, count)
end

"""
$(TYPEDSIGNATURES)

A helper function that will ensure `test_ref` is open, execute `f()`, and close
`test_ref` again. A typical use would be to open a section, run some tests, and
then close the section again (handy for re-runnable tests).

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    OpenAndClose("My section") do
        # ...
    end
end
```
"""
function OpenAndClose(f, test_ref::TestRef, ctx=nothing)
    @_default_ctx
    ItemOpen(test_ref)
    f()
    ItemClose(test_ref)
end

"""
$(TYPEDSIGNATURES)

Open and then close `test_ref`.

# Examples
```julia
@register_test(engine, "foo", "bar") do ctx
    OpenAndClose("My section")
end
```
"""
OpenAndClose(test_ref::TestRef, ctx=nothing) = OpenAndClose(Returns(nothing), test_ref, ctx)
