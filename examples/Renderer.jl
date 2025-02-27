module Renderer

import CImGui as ig
import CImGui.lib as lib
import GLFW
import ModernGL as GL

function __init__()
    @static if Sys.isapple()
        # OpenGL 3.2 + GLSL 150
        global glsl_version = 150
        GLFW.WindowHint(GLFW.CONTEXT_VERSION_MAJOR, 3)
        GLFW.WindowHint(GLFW.CONTEXT_VERSION_MINOR, 2)
        GLFW.WindowHint(GLFW.OPENGL_PROFILE, GLFW.OPENGL_CORE_PROFILE) # 3.2+ only
        GLFW.WindowHint(GLFW.OPENGL_FORWARD_COMPAT, GL.GL_TRUE) # required on Mac
    else
        # OpenGL 3.0 + GLSL 130
        global glsl_version = 130
        GLFW.WindowHint(GLFW.CONTEXT_VERSION_MAJOR, 3)
        GLFW.WindowHint(GLFW.CONTEXT_VERSION_MINOR, 0)
        # GLFW.WindowHint(GLFW.OPENGL_PROFILE, GLFW.OPENGL_CORE_PROFILE) # 3.2+ only
        # GLFW.WindowHint(GLFW.OPENGL_FORWARD_COMPAT, GL.GL_TRUE) # 3.0+ only
    end
end

error_callback(err::GLFW.GLFWError) = @error "GLFW ERROR: code $(err.code) msg: $(err.description)"

function init_renderer(width, height, title::AbstractString)
    # setup GLFW error callback
    GLFW.SetErrorCallback(error_callback)

    # create window
    window = GLFW.CreateWindow(width, height, title)
    @assert window != C_NULL
    GLFW.MakeContextCurrent(window)
    GLFW.SwapInterval(1)  # enable vsync

    # setup Dear ImGui context
    ctx = ig.CreateContext()

    # setup Dear ImGui style
    ig.StyleColorsDark()
    # ig.StyleColorsClassic()
    # ig.StyleColorsLight()

    # setup Platform/Renderer bindings
    lib.ImGui_ImplGlfw_InitForOpenGL(Ptr{lib.GLFWwindow}(window.handle), true)
    
    lib.ImGui_ImplOpenGL3_Init("#version $(glsl_version)")

    return window, ctx
end

function renderloop(window, ctx, ui=()->nothing, hotloading=false)
    try
        while !GLFW.WindowShouldClose(window)
            GLFW.PollEvents()
            lib.ImGui_ImplOpenGL3_NewFrame()
            lib.ImGui_ImplGlfw_NewFrame()
            ig.NewFrame()

            hotloading ? Base.invokelatest(ui) : ui()

            ig.Render()
            GLFW.MakeContextCurrent(window)
            display_w, display_h = GLFW.GetFramebufferSize(window)
            GL.glViewport(0, 0, display_w, display_h)
            GL.glClearColor(0.2, 0.2, 0.2, 1)
            GL.glClear(GL.GL_COLOR_BUFFER_BIT)
            lib.ImGui_ImplOpenGL3_RenderDrawData(Ptr{Cint}(ig.GetDrawData()))

            GLFW.MakeContextCurrent(window)
            GLFW.SwapBuffers(window)
            yield()
        end
    catch e
        @error "Error in renderloop!" exception=e
        Base.show_backtrace(stderr, catch_backtrace())
    finally
        lib.ImGui_ImplOpenGL3_Shutdown()
        lib.ImGui_ImplGlfw_Shutdown()
        ig.DestroyContext(ctx)
        GLFW.DestroyWindow(window)
    end
end

function render(ui; width=1280, height=720, title::AbstractString="Demo", hotloading=false)
    window, ctx = init_renderer(width, height, title)
    GC.@preserve window ctx begin
        t = @async renderloop(window, ctx, ui, hotloading)
    end
    return t
end

end # module