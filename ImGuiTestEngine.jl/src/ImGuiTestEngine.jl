module ImGuiTestEngine

import Compat: @compat
import CxxWrap: CxxPtr, CxxRef
import DocStringExtensions: TYPEDEF, TYPEDSIGNATURES


@compat public (Engine, EngineIO, ImGuiTest, TestRef, TestContextPtr,
                TestVerboseLevel,
                @register_test,
                CreateContext, DestroyContext, Start, Stop,
                SetRef, ItemClick)


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

include("context.jl")

import CImGui as ig
include("engine.jl")


end # ImGuiTestEngine
