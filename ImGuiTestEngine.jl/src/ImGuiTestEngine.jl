module ImGuiTestEngine

import Compat: @compat
import CxxWrap: CxxPtr, CxxRef
import DocStringExtensions: TYPEDEF, TYPEDSIGNATURES


export @register_test, @imcheck, @imcheck_noret,
    SetRef, GetRef, GetWindowByRef,
    ItemClick, ItemDoubleClick, ItemCheck, ItemOpen, ItemClose,
    MenuClick,
    ComboClick, ComboClickAll,
    MouseClick, MouseMove,
    Yield,
    OpenAndClose

@compat public (Engine, EngineIO, ImGuiTest, TestRef, TestContext,
                TestGroup, TestRunFlags, TestVerboseLevel, RunSpeed,
                CreateContext, DestroyContext, Start, Stop, PostSwap, GetResult,
                QueueTest, QueueTests)


#=
A semi-internal module where the raw bindings from the test engine are
available. Do not use these symbols unless you know what you're doing, they are
not safe.
=#
module lib

using CxxWrap
import CImGuiPack_jll

@wrapmodule(Returns(CImGuiPack_jll.libcimgui))

function __init__()
    @initcxx
end

end # lib

include("coroutine.jl")

import Test
import CImGui.lib as libig

if !isdefined(Base, :ScopedValues)
    import ScopedValues: ScopedValue, @with
else
    import Base.ScopedValues: ScopedValue, @with
end
import CImGui as ig
include("context.jl")

include("engine.jl")

"""
$(TYPEDSIGNATURES)

The main test engine window, which lets you run the tests individually. It needs
to be called within the render loop.

# Examples
```julia
ctx = ig.CreateContext()
engine = te.CreateContext()
te.Start(engine, ctx)

# This is the important bit
ig.render(ctx) do
    te.ShowTestEngineWindows(engine)
end

te.Stop(engine)
te.DestroyContext(engine)
```
"""
function ShowTestEngineWindows(engine::Engine)
    lib.ImGuiTestEngine_ShowTestEngineWindows(engine.ptr, C_NULL)
end

end # ImGuiTestEngine
