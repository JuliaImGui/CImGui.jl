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

"""
$(TYPEDSIGNATURES)

Set the current reference.
"""
function SetRef(ctx::TestContext, test_ref::TestRef)
    lib.SetRef(ctx, lib.ImGuiTestRef(test_ref))
end

"""
$(TYPEDSIGNATURES)

Simulate a click on the reference.
"""
function ItemClick(ctx::TestContext, test_ref::TestRef)
    lib.ItemClick(ctx, lib.ImGuiTestRef(test_ref))
end
