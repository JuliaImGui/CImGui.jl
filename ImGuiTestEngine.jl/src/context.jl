const TestContext = Ptr{ImGuiTestContext}

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
        Check($file, "", $line, CheckFlags_None, success, $expr_string)
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
@register_test(engine, "foo", "bar") do
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

"""
$(TYPEDSIGNATURES)

A helper function that will ensure `test_ref` is open, execute `f()`, and close
`test_ref` again. A typical use would be to open a section, run some tests, and
then close the section again (handy for re-runnable tests).

# Examples
```julia
@register_test(engine, "foo", "bar") do
    OpenAndClose("My section") do
        # ...
    end
end
```
"""
function OpenAndClose(f, test_ref::TestRef)
    ItemOpen(test_ref)
    f()
    ItemClose(test_ref)
end

"""
$(TYPEDSIGNATURES)

Open and then close `test_ref`.

# Examples
```julia
@register_test(engine, "foo", "bar") do
    OpenAndClose("My section")
end
```
"""
OpenAndClose(test_ref::TestRef) = OpenAndClose(Returns(nothing), test_ref)
