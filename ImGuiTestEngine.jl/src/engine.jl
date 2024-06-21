## ImGuiTestEngine

"""
$(TYPEDEF)

Wrapper around the upstream `ImGuiTest`. Don't create this yourself, use
[`@register_test()`](@ref). Once it's created you can assign functions to:
- `GuiFunc`, for standalone GUI code that you want to run/test. This shouldn't
  be necessary if you're testing your own GUI.
- `TestFunc`, for tests that you want to execute.

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

Represents a test engine context. This a wrapper around the upstream
`ImGuiTestEngine` type.
"""
mutable struct Engine
    ptr::Union{CxxPtr{lib.ImGuiTestEngine}, Nothing}

    # This field is meant to prevent ImGuiTest objects from being garbage
    # collected along with their functions/CFunction's.
    tests::Vector{ImGuiTest}

    function Engine(ptr::CxxPtr{lib.ImGuiTestEngine})
        self = new(ptr, Any[])

        engine_io = GetIO(self)
        interface_ptr = pointer_from_objref(_Coroutine.interface)
        lib.CoroutineFuncs!(engine_io, CxxPtr{lib.ImGuiTestCoroutineInterface}(interface_ptr))

        finalizer(self) do engine
            if isassigned(engine)
                DestroyContext(engine)
            end
        end
    end
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

Create a test engine context.
"""
CreateContext() = Engine(lib.ImGuiTestEngine_CreateContext())

"""
$(TYPEDSIGNATURES)

Destroy a test engine context.
"""
function DestroyContext(engine::Engine)
    if !isassigned(engine)
        throw(ArgumentError("This `Engine` has already been destroyed, cannot destroy it again."))
    end

    lib.ImGuiTestEngine_DestroyContext(engine.ptr)
    engine.ptr = nothing
    empty!(engine.tests)

    return nothing
end

"""
$(TYPEDSIGNATURES)

Start a test engine context.
"""
function Start(engine::Engine, ctx::Ptr{ig.ImGuiContext})
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
"""
function Stop(engine::Engine)
    if !isassigned(engine)
        throw(ArgumentError("The `Engine` has already been destroyed, cannot stop it."))
    end

    lib.ImGuiTestEngine_Stop(engine.ptr)
end

"""
$(TYPEDEF)

A wee typedef for `ImGuiTestEngineIO`. Get this from an [`Engine`](@ref) with
[`GetIO()`](@ref).

Supported properties:
- `ConfigVerboseLevel`

!!! danger
    This a memory-unsafe type, only use it while the engine is alive.
"""
const EngineIO = CxxRef{lib.ImGuiTestEngineIO}

"""
$(TYPEDSIGNATURES)

Get the [`EngineIO`](@ref) object for an engine.
"""
GetIO(engine::Engine) = lib.ImGuiTestEngine_GetIO(engine.ptr)

@enum TestVerboseLevel begin
    TestVerboseLevel_Silent = lib.ImGuiTestVerboseLevel_Silent
    TestVerboseLevel_Error = lib.ImGuiTestVerboseLevel_Error
    TestVerboseLevel_Warning = lib.ImGuiTestVerboseLevel_Warning
    TestVerboseLevel_Info = lib.ImGuiTestVerboseLevel_Info
    TestVerboseLevel_Debug = lib.ImGuiTestVerboseLevel_Debug
    TestVerboseLevel_Trace = lib.ImGuiTestVerboseLevel_Trace
    TestVerboseLevel_COUNT = lib.ImGuiTestVerboseLevel_COUNT
end

function Base.show(io::IO, engine_io::EngineIO)
    addr = UInt(engine_io.cpp_object)
    hex_addr = string(addr; base=16)
    print(io, EngineIO, "(pointer to 0x$(hex_addr))")
end

# `cpp_object` is from `CxxRef`
Base.propertynames(::EngineIO) = (:cpp_object, :ConfigVerboseLevel,)

function Base.getproperty(engine_io::EngineIO, name::Symbol)
    if name == :ConfigVerboseLevel
        TestVerboseLevel(lib.ConfigVerboseLevel(engine_io))
    else
        getfield(engine_io, name)
    end
end

function Base.setproperty!(engine_io::EngineIO, name::Symbol, value)
    if name == :ConfigVerboseLevel
        lib.ConfigVerboseLevel!(engine_io, Int(value))
    else
        setfield!(engine_io, name, value)
    end
end

## ImGuiTest

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
        func(TestContext(ctx))
    catch ex
        @error "Caught exception while executing $(func_name) of $(test)!" exception=ex
    end

    return nothing
end

"""
$(TYPEDSIGNATURES)

Register a [`ImGuiTest`](@ref).
"""
macro register_test(engine::Symbol, category::AbstractString, name::AbstractString)
    file = __source__.file
    line = __source__.line

    quote
        local ptr = lib.ImGuiTestEngine_RegisterTest($(esc(engine)).ptr, $category, $name, $(string(file)), $line)
        local test = ImGuiTest(ptr, nothing, nothing, nothing, nothing)
        push!($(esc(engine)).tests, test)

        test
    end
end
