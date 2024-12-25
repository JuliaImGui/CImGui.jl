```@meta
CurrentModule = ImGuiTestEngine
```

# ImGuiTestEngine.jl

This package provides Julia bindings for the
[Dear ImGui test engine](https://github.com/ocornut/imgui_test_engine), a
testing and automation library for [Dear
ImGui](https://github.com/ocornut/imgui). It's designed to be used with programs
written with [CImGui.jl](https://juliaimgui.github.io/ImGuiDocs.jl/cimgui).

Known issues:
- Some parts of the integration with [`@imcheck`](@ref) and the stdlib `Test`
  are incomplete.
- Many functions don't have Julia bindings yet (though adding them is fairly
  straightforward).

Here's a quick example:
```julia
# Imports that we'll be using
using ImGuiTestEngine
import ImGuiTestEngine as te
import CImGui as ig

# Set up the backend for CImGui
import GLFW
import ModernGL
ig.set_backend(:GlfwOpenGL3)

# Create the ImGui context and test engine instance
ctx = ig.CreateContext()
engine = te.CreateContext(; exit_on_completion=false)

# Make them run at a humanly-visible speed
engine_io = te.GetIO(engine)
engine_io.ConfigRunSpeed = te.RunSpeed_Normal

# Create a test that'll click a button
clicked = false
@register_test(engine, "foo", "bar") do ctx
    SetRef("Foo")
    ItemClick("Click me")
    @imcheck clicked
end

# Start the renderloop, this is where your program should be running. Note that
# we pass the engine to the renderloop, it will take care of starting and
# queueing the engine.
ig.render(ctx; engine) do
    ig.Begin("Foo")
    ig.Text("Hello world!")
    if ig.Button("Click me")
        @info "Hello world!"
        global clicked = true
    end
    ig.End()
end

# Note that we don't need to explictly destroy `ctx` because `ig.render()` will
# do it for us.
te.DestroyContext(engine)
```
