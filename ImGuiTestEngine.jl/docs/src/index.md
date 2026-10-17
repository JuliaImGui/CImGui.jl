```@meta
CurrentModule = ImGuiTestEngine
```

# ImGuiTestEngine.jl

This package provides Julia bindings for the
[Dear ImGui test engine](https://github.com/ocornut/imgui_test_engine), a
testing and automation library for [Dear
ImGui](https://github.com/ocornut/imgui). It's designed to be used with programs
written with [CImGui.jl](https://juliaimgui.github.io/ImGuiDocs.jl/cimgui). As
with CImGui.jl the majority of the code is generated automatically from the test
engine C bindings, but there are some differences to the C++ library to be aware
of:
- Don't create [`ImGuiTestRef`](@ref) objects directly, instead pass either
  strings or integers and they will be automatically converted.
- All functions have the `ImGuiTestEngine` prefix stripped from them, including
  top-level functions like `ImGuiTestEngine_ShowTestEngineWindows` (which is
  just [`ShowTestEngineWindows()`](@ref)).
- Enums beginning with `ImGui*` or `ImGuiTest*` have aliases defined for them
  with those prefixes stripped. e.g. `ImGuiCaptureFlags_None` has the alias
  `CaptureFlags_None` and `ImGuiTestRunSpeed_Fast` has the alias
  `RunSpeed_Fast`.
- All of the `ImGuiTestContext` methods like [`SetRef()`](@ref) and
  [`MouseClick()`](@ref) etc are able to automatically detect the current test
  context so you never need to pass the `self` argument to them. i.e. instead of
  e.g. `SetRef(test_ctx, "Foo")` just `SetRef("Foo")` will work.

Known issues:
- Some parts of the integration with [`@imcheck`](@ref) and the stdlib `Test`
  are incomplete and errors may not be reported properly.

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
@register_test(engine, "foo", "bar") do
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
