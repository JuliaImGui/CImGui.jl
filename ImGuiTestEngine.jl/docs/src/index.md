# ImGuiTestEngine.jl

This package provides Julia bindings for the
[Dear ImGui test engine](https://github.com/ocornut/imgui_test_engine), a
testing library for [Dear ImGui](https://github.com/ocornut/imgui). It's
designed to be used with programs written with
[CImGui.jl](https://github.com/Gnimuc/CImGui.jl).

Here's a quick example:
```julia
import ImGuiTestEngine as te

import CImGui as ig
import GLFW
import ModernGL
ig.backend = :GlfwOpenGL


ctx = ig.CreateContext()
engine = te.CreateContext()
engine_io = te.GetIO(engine)
engine_io.ConfigVerboseLevel = te.TestVerboseLevel_Debug

te.Start(engine, ctx)

t = te.@register_test(engine, "foo", "bar")
t.GuiFunc = (ctx) -> begin
    ig.Begin("Foo")
    ig.Text("Hello world!")
    ig.Button("Click me")
    ig.End()
end

t.TestFunc = (ctx) -> begin
    te.SetRef(ctx, "Foo")
    te.ItemClick(ctx, "Click me")
end

ig.render(ctx) do
    te.lib.ImGuiTestEngine_ShowTestEngineWindows(engine.ptr, C_NULL)
end

# Note that we don't need to explictly destroy `ctx` because `ig.render()` will
# do it for us.
te.Stop(engine)
te.DestroyContext(engine)
```
