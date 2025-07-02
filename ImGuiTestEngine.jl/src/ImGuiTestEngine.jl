module ImGuiTestEngine

import Test

import CImGui as ig
import CImGui.lib as libig
import DocStringExtensions: TYPEDEF, TYPEDSIGNATURES

if !isdefined(Base, :ScopedValues)
    import ScopedValues: ScopedValue, @with
else
    import Base.ScopedValues: ScopedValue, @with
end


export @register_test, @imcheck, @imcheck_noret

@static if Sys.WORD_SIZE == 64
    include(joinpath(@__DIR__, "..", "lib", "x86_64-linux-gnu.jl"))
else
    include(joinpath(@__DIR__, "..", "lib", "i686-linux-gnu.jl"))
end

# Copy constructor, needed to allow passing ImGuiTestRef's as ref arguments to
# the context functions in wrapper.jl.
lib.ImGuiTestRef(ref::lib.ImGuiTestRef) = lib.ImGuiTestRef(ref.ID, ref.Path)

include("engine.jl")

include("wrapper.jl")

include("coroutine.jl")

include("context.jl")

end # ImGuiTestEngine
