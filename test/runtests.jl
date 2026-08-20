using Test
import CImGui as ig
using ImGuiTestEngine
import ImGuiTestEngine as te
import ModernGL, GLFW

ig.set_backend(:GlfwOpenGL3)


# Note: these tests may not be portable
@testset "Setting renderloop threads" begin
    if Threads.nthreads() == 1
        @warn "Skipping the renderloop threads test because we're only running with one thread."
        return
    elseif Threads.nthreads(:default) == 0 || Threads.nthreads(:interactive) == 0
        @warn "Skipping the renderloop threads test because one of the threadpools is empty."
        return
    end

    ctx = ig.CreateContext()

    # The default thread should be 1
    tid = -1
    ig.render(ctx) do
        tid = Threads.threadid()
        return :imgui_exit_loop
    end
    @test tid == 1

    # Test pinning to a specific thread ID
    ctx = ig.CreateContext()
    ig.render(ctx; spawn=2) do
        tid = Threads.threadid()
        return :imgui_exit_loop
    end
    @test tid == 2

    # Test pinning to a threadpool
    ctx = ig.CreateContext()
    ig.render(ctx; spawn=:interactive) do
        tid = Threads.threadid()
        return :imgui_exit_loop
    end
    @test tid in Threads.threadpooltids(:interactive)

    # Test pinning to any thread, which should prioritize the interactive
    # threadpool.
    ctx = ig.CreateContext()
    ret = ig.render(ctx; spawn=true) do
        tid = Threads.threadid()
        return :imgui_exit_loop
    end
    @test tid in Threads.threadpooltids(:interactive)

    # When not spawning it should run on the current thread
    ctx = ig.CreateContext()
    tid = -1
    ig.render(ctx; spawn=false) do
        tid = Threads.threadid()
        return :imgui_exit_loop
    end
    @test tid == Threads.threadid()

    # It should return a Task when wait=false
    ctx = ig.CreateContext()
    ret = ig.render(Returns(:imgui_exit_loop), ctx; wait=false)
    wait(ret)
end

include(joinpath(@__DIR__, "../demo/demo.jl"))

@testset "Official demo" begin
    @test ig.imgui_version() isa VersionNumber
    engine = te.CreateContext()

    @register_test(engine, "Official demo", "Hiding demo window") do
        @imcheck GetWindowByRef("Dear ImGui Demo") != C_NULL

        SetRef("Hello, world!")
        ItemClick("Demo Window") # This should hide the demo window

        @imcheck GetWindowByRef("Dear ImGui Demo") == C_NULL
    end

    official_demo(; engine)

    te.DestroyContext(engine)
end

include(joinpath(@__DIR__, "../examples/demo.jl"))

@testset "Julia demo" begin
    engine = te.CreateContext(; exit_on_completion=true)
    engine_io = te.GetIO(engine)
    # engine_io.ConfigRunSpeed = te.RunSpeed_Normal

    @register_test(engine, "Julia demo", "About window") do
        SetRef("ImGui Demo")
        MenuClick("Help/About Dear ImGui")

        Yield() # Let it run another frame so that the new window can be drawn
        @imcheck GetWindowByRef("//About Dear ImGui") != nothing

        SetRef("About Dear ImGui")
        ItemCheck("Config\\/Build Information")
    end

    @register_test(engine, "Examples", "Main menu bar") do
        SetRef("ImGui Demo")
        MenuClick("Examples/Main menu bar")

        SetRef("##MainMenuBar")
        MenuClick("File/Open Recent/More../Recurse..")
        MenuClick("File/Options")
        MenuClick("File/Colors")
        MenuClick("File/Quit")
    end

    @register_test(engine, "Examples", "Long text display") do
        SetRef("ImGui Demo")
        MenuClick("Examples/Long text display")

        SetRef("Example: Long text display")
        ItemClick("Add 1000 lines")
        ComboClickAll("Test type")
    end

    @register_test(engine, "Examples", "Constrained-resizing window") do
        SetRef("ImGui Demo")
        MenuClick("Examples/Constrained-resizing window")

        SetRef("Example: Constrained Resize")
        ComboClickAll("Constraint")
    end

    @register_test(engine, "Configuration", "ConfigFlags") do
        SetRef("ImGui Demo")
        ItemClick("Configuration")
        ItemClick("Configuration##2")
        SetRef("ImGui Demo/Configuration##2")
        ItemCheck("io.ConfigFlags: NoMouse")
    end

    @register_test(engine, "Julia demo", "Widgets") do
        SetRef("ImGui Demo")
        ItemClick("Widgets")

        # We do double-clicks to open and then close the sections
        ItemDoubleClick("Basic")
        ItemDoubleClick("Trees/Basic trees")
        ItemDoubleClick("Trees/Advanced, with Selectable nodes")
        ItemClick("Trees") # Close the 'Trees' section
        ItemDoubleClick("Collapsing Headers")
        ItemDoubleClick("Bullets")
        ItemDoubleClick("Text/Colored Text")
        ItemDoubleClick("Text/Word Wrapping")
        ItemClick("Text") # Close the 'Text' section
        ItemDoubleClick("Images")
        ItemDoubleClick("Combo")

        ItemClick("Selectables/Basic")
        SetRef("ImGui Demo/Selectables/Basic")
        ItemDoubleClick("5. I am double clickable")
        SetRef("ImGui Demo")
        ItemClick("Selectables")

        ItemDoubleClick("Filtered Text Input")
        ItemDoubleClick("Multi-line Text Input")
        ItemDoubleClick("Plots Widgets")
        ItemDoubleClick("Color\\/Picker Widgets")
        ItemDoubleClick("Range Widgets")
        ItemDoubleClick("Multi-component Widgets")
        ItemDoubleClick("Vertical Sliders")
        ItemDoubleClick("Drag and Drop")
        ItemDoubleClick("Querying Status (Active\\/Focused\\/Hovered etc.)")

        ItemClick("Widgets") # Close the 'Widgets' section
    end

    @register_test(engine, "Julia demo", "Layout") do
        SetRef("ImGui Demo")
        ItemClick("Layout")

        ItemClick("Child windows")
        ItemDoubleClick("Child windows/Disable Mouse Wheel")
        ItemDoubleClick("Child windows/Disable Menu")
        ItemClick("Child windows")

        ItemDoubleClick("Widgets Width")
        ItemDoubleClick("Basic Horizontal Layout")

        ItemClick("Tabs")
        ItemDoubleClick("Tabs/Basic")
        ItemDoubleClick("Tabs/Advanced & Close Button")
        ItemClick("Tabs")

        ItemDoubleClick("Groups")

        ItemClick("Layout")
    end

    @register_test(engine, "Julia demo", "Popups & modal windows") do
        SetRef("ImGui Demo")
        OpenAndClose("Popups & Modal windows") do
            OpenAndClose("Popups") do
                ItemDoubleClick("Popups/Select..")
                ItemDoubleClick("Popups/Toggle..")
                ItemDoubleClick("Popups/File Menu..")
            end

            OpenAndClose("Context menus") do
                ItemClick("Context menus/Button: Label1###Button", ig.ImGuiMouseButton_Right)
                ItemClick("//\$FOCUSED/Close")
            end

            OpenAndClose("Modals") do
                ItemClick("Modals/Delete..")
                ItemClick("//\$FOCUSED/OK")

                ItemClick("Modals/Stacked modals..")
                ItemClick("//\$FOCUSED/Add another modal..")
                ItemClick("//\$FOCUSED/Close")
                ItemClick("//\$FOCUSED/Close")
            end

            ItemDoubleClick("Menus inside a regular window")
        end
    end

    @register_test(engine, "Julia demo", "Columns") do
        SetRef("ImGui Demo")
        OpenAndClose("Columns") do
            OpenAndClose("Columns/Basic")
            OpenAndClose("Columns/Mixed items")
            OpenAndClose("Columns/Word-wrapping")
            OpenAndClose("Columns/Borders") do
                ItemClick("Columns/Borders/horizontal")
                ItemClick("Columns/Borders/vertical")
            end
            OpenAndClose("Columns/Tree within single cell") do
                ItemClick("Columns/Tree within single cell/Hello")
            end
        end
    end

    @register_test(engine, "Julia demo", "Inputs") do
        SetRef("ImGui Demo")
        OpenAndClose("Inputs, Navigation & Focus") do
            section = "Keyboard, Mouse & Navigation State"
            OpenAndClose("Keyboard, Mouse & Navigation State") do
                MouseMove("$section/Hovering me sets the\nkeyboard capture flag")
                ItemClick("$section/Holding me clears the\nthe keyboard capture flag")
            end

            OpenAndClose("Tabbing")
            OpenAndClose("Focus from code")
            OpenAndClose("Dragging")
            OpenAndClose("Mouse cursors")
        end
    end

    julia_demo(; engine)

    te.DestroyContext(engine)
end

@testset "Image Texture" begin
    ctx = ig.CreateContext()

    ig.render(ctx) do
        img_id = ig.create_image_texture(256, 256)
        ig.update_image_texture(img_id, rand(UInt8, 256, 256, 4), 256, 256)
        ig.destroy_image_texture(img_id)
        return :imgui_exit_loop
    end
end

include(joinpath(@__DIR__, "../examples/makie_demo.jl"))

@testset "MakieFigure" begin
    engine = te.CreateContext()

    @register_test(engine, "Makie demo", "Simple plot") do
        SetRef("Makie demo")
        ItemClick("Random data")
    end

    makie_demo(; engine)
    te.DestroyContext(engine)
end

@testset "Screen capture" begin
    # RGBA8 packing: byte 0 = R (low byte), matching IM_COL32(r,g,b,a) and
    # glReadPixels(GL_RGBA, GL_UNSIGNED_BYTE).
    rgba(r, g, b, a) = UInt32(r) | (UInt32(g) << 8) | (UInt32(b) << 16) | (UInt32(a) << 24)
    RED   = rgba(255, 0, 0, 255)
    GREEN = rgba(0, 255, 0, 255)
    BLUE  = rgba(0, 0, 255, 255)
    WHITE = rgba(255, 255, 255, 255)

    window_size = (1280, 720)
    ctx = ig.CreateContext()
    engine = te.CreateContext(; exit_on_completion=true, show_test_window=false)

    # Draw a fullscreen 4-quadrant solid-color pattern via the background draw
    # list. Distinct colors per corner catch orientation/channel/DPI errors.
    t = @register_test(engine, "Screen capture", "Quadrant pattern")
    t.GuiFunc = () -> begin
        dl = ig.GetBackgroundDrawList()
        vp = ig.GetMainViewport()
        pos = unsafe_load(vp.Pos)
        sz = unsafe_load(vp.Size)
        cx = pos.x + sz.x / 2
        cy = pos.y + sz.y / 2
        ig.AddRectFilled(dl, ig.ImVec2(pos.x, pos.y), ig.ImVec2(cx, cy), RED)                  # top-left
        ig.AddRectFilled(dl, ig.ImVec2(cx, pos.y), ig.ImVec2(pos.x + sz.x, cy), GREEN)         # top-right
        ig.AddRectFilled(dl, ig.ImVec2(pos.x, cy), ig.ImVec2(cx, pos.y + sz.y), BLUE)          # bottom-left
        ig.AddRectFilled(dl, ig.ImVec2(cx, cy), ig.ImVec2(pos.x + sz.x, pos.y + sz.y), WHITE)  # bottom-right
    end

    # Results captured from inside the TestFunc coroutine.
    result = Ref{Any}(nothing)

    # The output image buffer; the capture tool fills Width/Height/Data.
    imbuf = Ref(te.lib.ImGuiCaptureImageBuf(Cint(0), Cint(0), Ptr{Cuint}(C_NULL)))

    t.TestFunc = () -> begin
        GC.@preserve imbuf begin
            # A known sub-rect of the screen, in logical (display) coordinates,
            # centered on the screen center so its four quadrants land in the
            # four screen-color quadrants.
            rw, rh = 400f0, 300f0
            cx, cy = window_size[1] / 2, window_size[2] / 2
            rx, ry = cx - rw / 2, cy - rh / 2
            rect = ig.ImRect(ig.ImVec2(rx, ry), ig.ImVec2(rx + rw, ry + rh))
            args = Ref(te.lib.ImGuiCaptureArgs(
                UInt32(te.lib.ImGuiCaptureFlags_Instant) | UInt32(te.lib.ImGuiCaptureFlags_NoSave),
                te.lib.ImVector_ImGuiWindowPtr(Cint(0), Cint(0), Ptr{Ptr{ig.lib.ImGuiWindow}}(C_NULL)),
                rect,
                0f0,
                ntuple(_ -> Cchar(0), 256),
                Base.unsafe_convert(Ptr{te.lib.ImGuiCaptureImageBuf}, imbuf),
                Cint(0), Cint(0),
                ig.ImVec2(0f0, 0f0),
            ))

            # Drives PostSwap -> CaptureUpdate -> ScreenCaptureFunc. The render
            # loop advances frames while this yields.
            ok = te.CaptureScreenshot(engine, args)

            b = imbuf[]
            W, H = Int(b.Width), Int(b.Height)
            # Sample the four quadrant centers of the captured sub-rect. The
            # sub-rect is centered on the screen center, so each of its quadrants
            # lands in one of the screen quadrants.
            sample(px, py) = unsafe_load(b.Data, py * W + px + 1)
            result[] = (;
                ok, W, H,
                tl = sample(W ÷ 4, H ÷ 4),
                tr = sample(3W ÷ 4, H ÷ 4),
                bl = sample(W ÷ 4, 3H ÷ 4),
                br = sample(3W ÷ 4, 3H ÷ 4),
            )
        end
    end

    # The render loop's test-engine startup queues all registered tests.
    ig.render(ctx; engine, window_title="CImGui capture test", window_size) do
        return nothing
    end

    @test result[] !== nothing
    r = result[]
    # Capture must succeed
    @test r.ok
    # Buffer is sized to the requested rect (logical pixels).
    @test r.W == 400
    @test r.H == 300
    # Orientation + channel order + DPI: each quadrant has the expected color.
    @test r.tl == RED
    @test r.tr == GREEN
    @test r.bl == BLUE
    @test r.br == WHITE

    te.DestroyContext(engine)
end
