## ImGuiTestEngine

"""
$(TYPEDEF)

Wrapper around the upstream `ImGuiTest`. Don't create this yourself, use
[`@register_test()`](@ref). Once it's created you can assign functions to these
properties:
- `GuiFunc::Function`, for standalone GUI code that you want to run/test. This
  shouldn't be necessary if you're testing your own GUI.
- `TestFunc::Function`, for tests that you want to execute.

The functions you assign should not take any arguments, and any return value
will be discarded.

!!! danger
    This a memory-unsafe type, only use it while the engine is alive.
"""
mutable struct ImGuiTest
    ptr::Union{Ptr{lib.ImGuiTest}, Nothing}

    _gui_func::Union{Function, Nothing}
    _gui_cfunction::Union{Base.CFunction, Nothing}
    _test_func::Union{Function, Nothing}
    _test_cfunction::Union{Base.CFunction, Nothing}
end

"""
$(TYPEDEF)

Represents a test engine context. This a wrapper around the upstream
`ImGuiTestEngine` type. Don't create it yourself, use [`CreateContext()`](@ref).
"""
mutable struct Engine
    ptr::Union{Ptr{lib.ImGuiTestEngine}, Nothing}
    exit_on_completion::Bool
    show_test_window::Bool

    # This field is meant to prevent ImGuiTest objects from being garbage
    # collected along with their functions/CFunction's.
    tests::Vector{ImGuiTest}
end

function Base.getproperty(engine::Engine, name::Symbol)
    if name in fieldnames(Engine)
        getfield(engine, name)
    else
        getproperty(getfield(engine, :ptr), name)
    end
end

function Base.unsafe_convert(::Type{Ptr{lib.ImGuiTestEngine}}, engine::Engine)
    if !isassigned(engine)
        throw(ArgumentError("Engine does not hold a valid pointer, cannot convert to to a Ptr{ImGuiTestEngine}"))
    end

    engine.ptr
end

function Base.show(io::IO, engine::Engine)
    if isassigned(engine)
        ntests = unsafe_load(engine.ptr.TestsAll).Size
        print(io, Engine, "($(ntests) tests)")
    else
        print(io, Engine, "(<destroyed>)")
    end
end

Base.isassigned(engine::Engine) = !isnothing(engine.ptr)

"""
$(TYPEDSIGNATURES)

Create a test engine context. The keyword arguments don't do anything in this
library, they're used to support the test engine in CImGui.jl's renderloop.

# Arguments
- `exit_on_completion=true`: Exit the program after the tests have
  completed.
- `show_test_window=true`: Call [`ShowTestEngineWindows()`](@ref) while
  running the tests.

# Examples
```julia
engine = te.CreateContext()
```
"""
function CreateContext(; exit_on_completion=true, show_test_window=true)
    ptr = lib.cImGuiTestEngine_CreateContext()
    engine = Engine(ptr, exit_on_completion, show_test_window, ImGuiTest[])

    engine_io = engine.IO
    interface_ptr = Base.unsafe_convert(Ptr{ImGuiTestCoroutineInterface}, _Coroutine.interface)
    engine_io.CoroutineFuncs = interface_ptr

    finalizer(engine) do engine
        if isassigned(engine)
            DestroyContext(engine)
        end
    end
end

"""
$(TYPEDSIGNATURES)

Destroy a test engine context.

# Arguments
- `throw=true`: Whether to throw an exception if the engine has already been
  destroyed.

# Examples
```julia
engine = te.CreateContext()
te.DestroyContext(engine)
```
"""
function DestroyContext(engine::Engine; throw=true)
    if !isassigned(engine)
        if throw
            Base.throw(ArgumentError("This `Engine` has already been destroyed, cannot destroy it again."))
        else
            return
        end
    end

    lib.cImGuiTestEngine_DestroyContext(engine.ptr)
    engine.ptr = nothing
    empty!(engine.tests)

    return nothing
end

function GetResultSummary(engine::Engine)
    if !isassigned(engine)
        throw(ArgumentError("The `Engine` has already been destroyed, cannot use it."))
    end

    ret = Ref{ImGuiTestEngineResultSummary}()
    GetResultSummary(engine, ret)

    return ret[]
end

## ImGuiTest

function Base.show(io::IO, test::ImGuiTest)
    status = x -> isnothing(x) ? "✗" : "🗸"
    print(io, ImGuiTest, "(Category=$(test.Category), Name=$(test.Name))")
end

function Base.getproperty(test::ImGuiTest, name::Symbol)
    if name in fieldnames(ImGuiTest)
        return getfield(test, name)
    end

    x = unsafe_load(getproperty(getfield(test, :ptr), name))
    if name in (:Name, :Category, :SourceFile)
        unsafe_string(x)
    else
        x
    end
end

function Base.setproperty!(test::ImGuiTest, name::Symbol, value)
    if name in fieldnames(ImGuiTest)
        return setfield!(test, name, value)
    end

    if name == :GuiFunc || name == :TestFunc
        func = ctx -> _test_runner(test, name, ctx)
        func_cfunction = @cfunction($func, Cvoid, (Ptr{Cvoid},))
        func_ptr = Base.unsafe_convert(Ptr{Cvoid}, func_cfunction)

        if name == :GuiFunc
            test.ptr.GuiFunc = func_ptr
            test._gui_func = value
            test._gui_cfunction = func_cfunction
        elseif name == :TestFunc
            test.ptr.TestFunc = func_ptr
            test._test_func = value
            test._test_cfunction = func_cfunction
        end
    else
        setproperty!(test.ptr, name, value)
    end

    return value
end

function _test_runner(test::ImGuiTest, func_name::Symbol, ctx::Ptr{Cvoid})
    func = func_name == :GuiFunc ? test._gui_func : test._test_func

    if isnothing(func)
        @error "Function $(func_name) of $(test) has not been set"
        return nothing
    end

    try
        test_ctx = TestContext(ctx)
        @with _current_test_context=>test_ctx func()
    catch ex
        @error "Caught exception while executing $(func_name) of $(test)." exception=(ex, catch_backtrace())
    end

    return nothing
end

"""
    @register_test(engine, category::AbstractString, name::AbstractString)::ImGuiTest
    @register_test(f::Function, engine,
                   category::AbstractString, name::AbstractString)::ImGuiTest

Register a [`ImGuiTest`](@ref). Note that it will not be executed until the test
is queued, either programmatically with [`QueueTests()`](@ref) or by the user
running it manually through [`ShowTestEngineWindows()`](@ref).

# Examples
If you only need to set `TestFunc` you can use do-syntax:
```julia
engine = te.CreateContext()
@register_test(engine, "foo", "bar") do
    @imtest ctx isa te.TestContext
end
```

To set `GuiFunc` as well you'll need to set the `GuiFunc` property:
```julia
engine = te.CreateContext()
t = @register_test(engine, "foo", "bar")
t.GuiFunc = () -> begin
    ig.Begin("Foo")
    ig.End()
end
t.TestFunc = () -> @info "Hello world!"
```
"""
macro register_test(engine, category::AbstractString, name::AbstractString)
    file = string(__source__.file)
    line = __source__.line

    quote
        local ptr = RegisterTest($(esc(engine)), $category, $name, $file, $line)
        local test = ImGuiTest(ptr, nothing, nothing, nothing, nothing)
        push!($(esc(engine)).tests, test)

        test
    end
end

macro register_test(f, engine::Symbol, category::AbstractString, name::AbstractString)
    quote
        local test = @register_test($(esc(engine)), $category, $name)
        test.TestFunc = $(esc(f))

        test
    end
end


ig._test_engine_is_running(engine::Engine) = !IsTestQueueEmpty(engine)

function ig._start_test_engine(engine::Engine, ctx::Ptr{libig.ImGuiContext})
    Start(engine, ctx)
    QueueTests(engine, Group_Tests)
    QueueTests(engine, Group_Perfs)
end

ig._show_test_window(engine::Engine) = ShowTestEngineWindows(engine, C_NULL)
