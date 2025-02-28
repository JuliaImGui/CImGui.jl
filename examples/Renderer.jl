module Renderer

using CImGui
using ModernGL
using GLFW

# Note about this Renderer. The previous version of this was a lot longer version
# but now most of that code is in the backend CImGui.jl/ext/GlfwOpenGLBackend.jl
# renderloop and _render methods. 
# This module is no longer needed as CimGUI.render can be configured
# just as well and even better. This short rewrite is to show how to use CImGui.render
# and to get some examples working which are circulating in some older github threads about 
# state management.



function render(ui; width=1280, height=720, title::AbstractString="Demo", hotloading=false)
    ctx = CImGui.CreateContext()
    CImGui.set_backend(:GlfwOpenGL3)
    t = CImGui.render(ui, ctx; window_size=(width, height), window_title=title, hotloading, spawn=true, wait=false)
    return t
end

end # module
