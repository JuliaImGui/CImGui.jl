## ImGuiTestEngine

"""
$(TYPEDEF)

Wrapper around the upstream `ImGuiTest`. Don't create this yourself, use
[`@register_test()`](@ref). Once it's created you can assign functions to these
properties:
- `GuiFunc::Function`, for standalone GUI code that you want to run/test. This
  shouldn't be necessary if you're testing your own GUI.
- `TestFunc::Function`, for tests that you want to execute.

The functions you assign must take in one argument to a [`TestContext`](@ref).

!!! danger
    This a memory-unsafe type, only use it while the engine is alive.
"""
mutable struct ImGuiTest
    ptr::Union{CxxPtr{lib.ImGuiTest}, Nothing}

    _gui_func::Union{Function, Nothing}
    _gui_cfunction::Union{Base.CFunction, Nothing}
    _test_func::Union{Function, Nothing}
    _test_cfunction::Union{Base.CFunction, Nothing}
end

"""
$(TYPEDEF)

Wrapper for the upstream `ImGuiTestGroup` enum. Possible values:
- `TestGroup_Perfs`
- `TestGroup_Tests`
- `TestGroup_Unknown`
"""
@enum TestGroup begin
    TestGroup_COUNT = lib.ImGuiTestGroup_COUNT
    TestGroup_Perfs = lib.ImGuiTestGroup_Perfs
    TestGroup_Tests = lib.ImGuiTestGroup_Tests
    TestGroup_Unknown = lib.ImGuiTestGroup_Unknown
end

"""
$(TYPEDEF)

Wrapper for the upstream `ImGuiTestRunFlags` enum. Possible values:
- `TestRunFlags_None`
- `TestRunFlags_GuiFuncDisable`
- `TestRunFlags_GuiFuncOnly`
- `TestRunFlags_NoSuccessMsg`
- `TestRunFlags_EnableRawInputs`
- `TestRunFlags_RunFromGui`
- `TestRunFlags_RunFromCommandLine`
- `TestRunFlags_NoError`
- `TestRunFlags_ShareVars`
- `TestRunFlags_ShareTestContext`
"""
@enum TestRunFlags begin
    TestRunFlags_None = lib.ImGuiTestRunFlags_None
    TestRunFlags_GuiFuncDisable = lib.ImGuiTestRunFlags_GuiFuncDisable
    TestRunFlags_GuiFuncOnly = lib.ImGuiTestRunFlags_GuiFuncOnly
    TestRunFlags_NoSuccessMsg = lib.ImGuiTestRunFlags_NoSuccessMsg
    TestRunFlags_EnableRawInputs = lib.ImGuiTestRunFlags_EnableRawInputs
    TestRunFlags_RunFromGui = lib.ImGuiTestRunFlags_RunFromGui
    TestRunFlags_RunFromCommandLine = lib.ImGuiTestRunFlags_RunFromCommandLine

    TestRunFlags_NoError = lib.ImGuiTestRunFlags_NoError
    TestRunFlags_ShareVars = lib.ImGuiTestRunFlags_ShareVars
    TestRunFlags_ShareTestContext = lib.ImGuiTestRunFlags_ShareTestContext
end

"""
$(TYPEDEF)

Represents a test engine context. This a wrapper around the upstream
`ImGuiTestEngine` type. Don't create it yourself, use [`CreateContext()`](@ref).
"""
mutable struct Engine
    ptr::Union{CxxPtr{lib.ImGuiTestEngine}, Nothing}
    exit_on_completion::Bool
    show_test_window::Bool

    # This field is meant to prevent ImGuiTest objects from being garbage
    # collected along with their functions/CFunction's.
    tests::Vector{ImGuiTest}
end

function Base.show(io::IO, engine::Engine)
    if isassigned(engine)
        ntests = length(lib.TestsAll(engine.ptr))
        print(io, Engine, "($(ntests) tests)")
    else
        print(io, Engine, "(<destroyed>)")
    end
end

"""
$(TYPEDSIGNATURES)

Check if the `Engine` has a valid pointer to a test engine context.
"""
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
    ptr = lib.ImGuiTestEngine_CreateContext()
    engine = Engine(ptr, exit_on_completion, show_test_window, ImGuiTest[])

    engine_io = GetIO(engine)
    interface_ptr = pointer_from_objref(_Coroutine.interface)
    lib.CoroutineFuncs!(engine_io, CxxPtr{lib.ImGuiTestCoroutineInterface}(interface_ptr))

    finalizer(engine) do engine
        if isassigned(engine)
            DestroyContext(engine; throw=false)
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

    lib.ImGuiTestEngine_DestroyContext(engine.ptr)
    engine.ptr = nothing
    empty!(engine.tests)

    return nothing
end

"""
$(TYPEDSIGNATURES)

Start a test engine context. If you're using CImGui.jl's renderloop you *must
not* call this, it will be called automatically for you.

# Examples
```julia
ctx = ig.CreateContext()
engine = te.CreateContext()
te.Start(engine, ctx)
```
"""
function Start(engine::Engine, ctx::Ptr{libig.ImGuiContext})
    if !isassigned(engine)
        throw(ArgumentError("The `Engine` has already been destroyed, cannot start it."))
    end

    # ImGuiContext is wrapped in two different ways:
    # - By CxxWrap for ImGuiTestEngine
    # - By Clang.jl for CImGui.jl
    #
    # Hence here we need to convert the CImGui-wrapped pointer to a
    # ImGuiTestEngine-wrapped pointer.
    lib_ctx_ptr = CxxPtr(lib.Ptr2ImGuiContext(Ptr{Cvoid}(ctx)))
    lib.ImGuiTestEngine_Start(engine.ptr, lib_ctx_ptr)
end

"""
$(TYPEDSIGNATURES)

Stop a test engine context.

# Examples
```julia
ctx = ig.CreateContext()
engine = te.CreateContext()
te.Start(engine, ctx)
te.Stop(engine)
```
"""
function Stop(engine::Engine)
    if !isassigned(engine)
        throw(ArgumentError("The `Engine` has already been destroyed, cannot stop it."))
    end

    lib.ImGuiTestEngine_Stop(engine.ptr)
end

function PostSwap(engine::Engine)
    if !isassigned(engine)
        throw(ArgumentError("The `Engine` has already been destroyed, cannot use it."))
    end

    lib.ImGuiTestEngine_PostSwap(engine.ptr)
end

function GetResult(engine::Engine)
    if !isassigned(engine)
        throw(ArgumentError("The `Engine` has already been destroyed, cannot use it."))
    end

    n_executed = Ref{Cint}()
    n_successful = Ref{Cint}()
    lib.ImGuiTestEngine_GetResult(engine.ptr, n_executed, n_successful)

    return (; executed=n_executed[], successful=n_successful[])
end

"""
$(TYPEDSIGNATURES)

Queue a specific test for execution. If you're using the CImGui.jl renderloop
it shouldn't be necessary to call this yourself.

# Examples
```julia
engine = te.CreateContext()
t = @register_test(engine, "foo", "bar") do ctx
    @info "Hello world!"
end

te.QueueTest(engine, t)
```
"""
function QueueTest(engine::Engine, test::ImGuiTest, run_flags=TestRunFlags_None)
    lib.ImGuiTestEngine_QueueTest(engine.ptr, test.ptr, Int(run_flags))
end

"""
$(TYPEDSIGNATURES)

Queue all tests in a specific group. If you're using the CImGui.jl renderloop it
shouldn't be necessary to call this yourself.

# Examples
```julia
engine = te.CreateContext()
t = @register_test(engine, "foo", "bar") do ctx
    @info "Hello world!"
end

# Queue all tests
te.QueueTests(engine)
```
"""
function QueueTests(engine::Engine, group::TestGroup=TestGroup_Unknown,
                    filter="all", run_flags=TestRunFlags_None)
    lib.ImGuiTestEngine_QueueTests(engine.ptr, Int(group), filter, Int(run_flags))
end


## EngineIO


"""
$(TYPEDEF)

A wee typedef for `ImGuiTestEngineIO`. Get this from an [`Engine`](@ref) with
[`GetIO()`](@ref).

Supported properties:
- `ConfigSavedSettings::Bool`
- `ConfigRunSpeed::`[`RunSpeed`](@ref)
- `ConfigStopOnError::Bool`
- `ConfigKeepGuiFunc::Bool`
- `ConfigVerboseLevel::`[`TestVerboseLevel`](@ref)
- `ConfigVerboseLevelOnError::`[`TestVerboseLevel`](@ref)
- `ConfigRestoreFocusAfterTests::Bool`
- `ConfigCaptureEnabled::Bool`
- `ConfigCaptureOnError::Bool`
- `ConfigNoThrottle::Bool`
- `ConfigMouseDrawCursor::Bool`
- `IsRunningTests::Bool` (readonly)

!!! danger
    This a memory-unsafe type, only use it while the engine is alive.
"""
const EngineIO = CxxRef{lib.ImGuiTestEngineIO}

"""
$(TYPEDSIGNATURES)

Get the [`EngineIO`](@ref) object for an engine.

# Examples
```julia
engine = te.CreateContext()
engine_io = te.GetIO(engine)
```
"""
GetIO(engine::Engine) = lib.ImGuiTestEngine_GetIO(engine.ptr)

"""
$(TYPEDEF)

Wrapper around the upstream `ImGuiTestVerboseLevel`. Possible values:
- `TestVerboseLevel_Silent`
- `TestVerboseLevel_Error`
- `TestVerboseLevel_Warning`
- `TestVerboseLevel_Info`
- `TestVerboseLevel_Debug`
- `TestVerboseLevel_Trace`
"""
@enum TestVerboseLevel begin
    TestVerboseLevel_Silent = lib.ImGuiTestVerboseLevel_Silent
    TestVerboseLevel_Error = lib.ImGuiTestVerboseLevel_Error
    TestVerboseLevel_Warning = lib.ImGuiTestVerboseLevel_Warning
    TestVerboseLevel_Info = lib.ImGuiTestVerboseLevel_Info
    TestVerboseLevel_Debug = lib.ImGuiTestVerboseLevel_Debug
    TestVerboseLevel_Trace = lib.ImGuiTestVerboseLevel_Trace
    TestVerboseLevel_COUNT = lib.ImGuiTestVerboseLevel_COUNT
end

"""
$(TYPEDEF)

Wrapper around the upstream `ImGuiTestRunSpeed`. Possible values:
- `RunSpeed_Fast`
- `RunSpeed_Normal`
- `RunSpeed_Cinematic`
"""
@enum RunSpeed begin
    RunSpeed_Fast = lib.ImGuiTestRunSpeed_Fast
    RunSpeed_Normal = lib.ImGuiTestRunSpeed_Normal
    RunSpeed_Cinematic = lib.ImGuiTestRunSpeed_Cinematic
    RunSpeed_COUNT = lib.ImGuiTestRunSpeed_COUNT
end

function Base.show(io::IO, engine_io::EngineIO)
    addr = UInt(engine_io.cpp_object)
    hex_addr = string(addr; base=16)
    print(io, EngineIO, "(pointer to 0x$(hex_addr))")
end

const _engineio_booleans = (:ConfigSavedSettings, :ConfigStopOnError,
                            :ConfigKeepGuiFunc, :ConfigRestoreFocusAfterTests,
                            :ConfigCaptureEnabled, :ConfigCaptureOnError,
                            :ConfigNoThrottle, :ConfigMouseDrawCursor)
Base.propertynames(::EngineIO) = (:cpp_object, # From `CxxRef`
                                  _engineio_booleans...,
                                  :ConfigRunSpeed,
                                  :ConfigVerboseLevel, :ConfigVerboseLevelOnError,
                                  :IsRunningTests)

function Base.getproperty(engine_io::EngineIO, name::Symbol)
    if name in _engineio_booleans
        getproperty(lib, name)(engine_io)
    elseif name == :ConfigRunSpeed
        RunSpeed(lib.ConfigRunSpeed(engine_io))
    elseif name == :ConfigVerboseLevel
        TestVerboseLevel(lib.ConfigVerboseLevel(engine_io))
    elseif name == :ConfigVerboseLevelOnError
        TestVerboseLevel(lib.ConfigVerboseLevelOnError(engine_io))
    elseif name == :IsRunningTests
        # We handle this one specially because it's readonly
        lib.IsRunningTests(engine_io)
    else
        getfield(engine_io, name)
    end
end

function Base.setproperty!(engine_io::EngineIO, name::Symbol, value)
    if name in _engineio_booleans
        getproperty(lib, Symbol(name, :!))(engine_io, value)
    elseif name == :ConfigRunSpeed
        lib.ConfigRunSpeed!(engine_io, Int(value))
    elseif name == :ConfigVerboseLevel
        lib.ConfigVerboseLevel!(engine_io, Int(value))
    elseif name == :ConfigVerboseLevelOnError
        lib.ConfigVerboseLevelOnError!(engine_io, Int(value))
    else
        setfield!(engine_io, name, value)
    end
end


## ImGuiTest


function Base.show(io::IO, test::ImGuiTest)
    status = x -> isnothing(x) ? "✗" : "🗸"
    print(io, ImGuiTest, "(Category=$(test.Category), Name=$(test.Name))")
end

function Base.getproperty(test::ImGuiTest, name::Symbol)
    if name == :Name
        unsafe_string(lib.Name(test.ptr))
    elseif name == :Category
        unsafe_string(lib.Category(test.ptr))
    elseif name == :GuiFunc
        lib.GuiFunc(test.ptr)
    elseif name == :TestFunc
        lib.TestFunc(test.ptr)
    elseif name == :SourceFile
        unsafe_string(lib.SourceFile(test.ptr))
    elseif name == :SourceLine
        lib.SourceLine(test.ptr)
    else
        getfield(test, name)
    end
end

function Base.setproperty!(test::ImGuiTest, name::Symbol, value)
    if name != :GuiFunc && name != :TestFunc
        return setfield!(test, name, value)
    end

    func = ctx -> _test_runner(test, name, ctx)
    func_cfunction = @cfunction($func, Cvoid, (Ptr{Cvoid},))
    func_ptr = Base.unsafe_convert(Ptr{Cvoid}, func_cfunction)

    if name == :GuiFunc
        lib.set_GuiFunc(test.ptr, func_ptr)
        test._gui_func = value
        test._gui_cfunction = func_cfunction
    elseif name == :TestFunc
        lib.set_TestFunc(test.ptr, func_ptr)
        test._test_func = value
        test._test_cfunction = func_cfunction
    end
end

function _test_runner(test::ImGuiTest, func_name::Symbol, ctx::Ptr{Cvoid})
    func = func_name == :GuiFunc ? test._gui_func : test._test_func

    if isnothing(func)
        @error "Function $(func_name) of $(test) has not been set"
        return nothing
    end

    try
        test_ctx = TestContext(ctx)
        @with _current_test_context=>test_ctx func(test_ctx)
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
@register_test(engine, "foo", "bar") do ctx
    @imtest ctx isa te.TestContext
end
```

To set `GuiFunc` as well you'll need to set the `GuiFunc` property:
```julia
engine = te.CreateContext()
t = @register_test(engine, "foo", "bar")
t.GuiFunc = ctx -> begin
    ig.Begin("Foo")
    ig.End()
end
t.TestFunc = ctx -> @info "Hello world!"
```
"""
macro register_test(engine, category::AbstractString, name::AbstractString)
    file = string(__source__.file)
    line = __source__.line

    quote
        local ptr = lib.ImGuiTestEngine_RegisterTest($(esc(engine)).ptr, $category, $name, $file, $line)
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


ig._test_engine_is_running(engine::Engine) = !lib.ImGuiTestEngine_IsTestQueueEmpty(engine.ptr)

function ig._start_test_engine(engine::Engine, ctx::Ptr{libig.ImGuiContext})
    Start(engine, ctx)
    QueueTests(engine)
end

ig._show_test_window(engine::Engine) = ShowTestEngineWindows(engine)
