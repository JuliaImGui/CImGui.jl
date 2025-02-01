import Test
import Test: @testset, @test, @test_throws

import Aqua
using ImGuiTestEngine
import ImGuiTestEngine as te
import ImGuiTestEngine.lib as lib

import CImGui as ig

import GLFW
import ModernGL
ig.set_backend(:GlfwOpenGL3)


function do_engine(f::Function; kwargs...)
    engine = te.CreateContext(; kwargs...)

    try
        f(engine)
    finally
        te.Stop(engine)
        te.DestroyContext(engine)
    end
end

@testset "Engine" begin
    @testset "Create/destroy" begin
        # Create an engine
        engine = te.CreateContext()
        @test isassigned(engine)

        # Destroying it should change its assigned status
        te.DestroyContext(engine)
        @test !isassigned(engine)

        # Attempting to destroy it twice should not be allowed
        @test_throws ArgumentError te.DestroyContext(engine)

        # Test the finalizer
        engine = te.CreateContext()
        finalize(engine)
        @test !isassigned(engine)

        # Running the finalizer again shouldn't do anything
        finalize(engine)
    end

    @testset "EngineIO" begin
        # Test setting various properties
        do_engine() do engine
            engine_io = te.GetIO(engine)

            @test engine_io.ConfigRunSpeed != te.RunSpeed_Cinematic
            engine_io.ConfigRunSpeed = te.RunSpeed_Cinematic
            @test engine_io.ConfigRunSpeed == te.RunSpeed_Cinematic

            @test engine_io.ConfigVerboseLevel != te.TestVerboseLevel_Debug
            engine_io.ConfigVerboseLevel = te.TestVerboseLevel_Debug
            @test engine_io.ConfigVerboseLevel == te.TestVerboseLevel_Debug

            @test engine_io.ConfigVerboseLevelOnError != te.TestVerboseLevel_Debug
            engine_io.ConfigVerboseLevelOnError = te.TestVerboseLevel_Debug
            @test engine_io.ConfigVerboseLevelOnError == te.TestVerboseLevel_Debug

            @test engine_io.IsRunningTests isa Bool
            @test_throws ErrorException engine_io.IsRunningTests = true

            for boolean_property in te._engineio_booleans
                old = getproperty(engine_io, boolean_property)
                setproperty!(engine_io, boolean_property, !old)
                @test getproperty(engine_io, boolean_property) == !old
            end
        end
    end

    @testset "Start/stop" begin
        ctx = ig.CreateContext()
        engine = te.CreateContext()

        # Sanity test, just starting and stopping the engine
        te.Start(engine, ctx)
        @test te.lib.Started(engine.ptr)
        te.Stop(engine)
        @test !te.lib.Started(engine.ptr)

        te.DestroyContext(engine)
        @test !isassigned(engine)

        ig.DestroyContext(ctx)
    end

    @testset "ImGuiTest" begin
        @testset "Memory management and properties" begin
            engine = te.CreateContext()

            # Create a test
            line = @__LINE__
            t = te.@register_test(engine, "foo", "bar")

            @test t.SourceFile == @__FILE__
            @test t.SourceLine == line + 1

            # Test setting properties
            @test t isa te.ImGuiTest
            @test t.Category == "foo"
            @test t.Name == "bar"

            @test t.GuiFunc == C_NULL
            t.GuiFunc = Returns(1)
            @test t.GuiFunc != C_NULL

            @test t.TestFunc == C_NULL
            t.TestFunc = Returns(1)
            @test t.TestFunc != C_NULL

            # Even though we defined a test, we didn't execute it so the results
            # should be 0/0.
            @test te.GetResult(engine) == (; executed=0, successful=0)

            te.DestroyContext(engine)
        end

        @testset "GuiFunc/TestFunc" begin
            ctx = ig.CreateContext()
            engine = te.CreateContext()
            engine_io = te.GetIO(engine)

            ran_gui_func = false
            ran_test_func = false

            t = te.@register_test(engine, "foo", "bar")
            t.GuiFunc = (ctx) -> begin
                @test ctx isa te.TestContext

                ig.Begin("Foo")
                ig.Text("Hello world!")
                ig.Button("Click me")
                ig.End()

                ran_gui_func = true
            end
            t.TestFunc = (ctx) -> begin
                @test ctx isa te.TestContext

                te.SetRef("Foo")
                te.ItemClick("Click me")

                ran_test_func = true
            end

            ig.render(ctx; engine) do ; end

            @test ran_gui_func
            @test ran_test_func
            @test te.GetResult(engine) == (; executed=1, successful=1)

            te.Stop(engine)
            te.DestroyContext(engine)
        end
    end
end

@testset "Context" begin
    @testset "@imcheck macros" begin
        ctx = ig.CreateContext()
        do_engine() do engine
            imcheck_entered_test = false
            imcheck_exited_at_end = false
            noret_entered = false
            noret_exited_at_end = false

            # @imcheck should return early if the expression is false
            te.@register_test(engine, "foo", "imcheck") do ctx
                # Smoke test
                te.@imcheck true

                imcheck_entered_test = true
                te.@imcheck false jltest=false
                imcheck_exited_at_end = true
            end

            # @imcheck_noret should not
            te.@register_test(engine, "foo", "imcheck_noret") do ctx
                noret_entered = true
                te.@imcheck_noret false jltest=false
                noret_exited_at_end = true
            end

            ig.render(ctx; engine) do ; end

            @test imcheck_entered_test
            @test !imcheck_exited_at_end
            @test noret_entered
            @test noret_exited_at_end
        end
    end

    @testset "Context methods" begin
        ctx = ig.CreateContext()

        do_engine(; exit_on_completion=true) do engine
            engine_io = te.GetIO(engine)

            t = @register_test(engine, "Context", "Ref methods")
            t.GuiFunc = ctx -> begin
                ig.Begin("Window")
                ig.End()
            end
            t.TestFunc = ctx -> begin
                # Smoke tests
                @imcheck GetRef().id == 0
                SetRef("Window")
                window_id = GetRef().id
                @imcheck window_id != 0

                window = GetWindowByRef("//Window")
                SetRef(window)
                @imcheck GetRef().id == window_id
            end

            t = @register_test(engine, "Context", "GetWindowByRef")
            t.GuiFunc = ctx -> begin
                ig.Begin("Select window")
                ig.End()
            end
            t.TestFunc = ctx -> begin
                @imcheck te.GetWindowByRef("Select window") != C_NULL
                @imcheck te.GetWindowByRef("Nope") == nothing
            end

            menu_item_selected = false
            t = @register_test(engine, "Context", "MenuClick")
            t.GuiFunc = ctx -> begin
                ig.Begin("Menus", C_NULL, ig.ImGuiWindowFlags_MenuBar)

                if ig.BeginMenuBar()
                    if ig.BeginMenu("Foo")
                        if ig.MenuItem("Item 1")
                            menu_item_selected = true
                        end

                        ig.EndMenu()
                    end

                    ig.EndMenuBar()
                end

                ig.End()
            end
            t.TestFunc = ctx -> begin
                SetRef("Menus")
                MenuClick("Foo/Item 1")
                @imcheck menu_item_selected
            end

            current_combo_item = Ref{Cint}(-1)
            selected_combo_items = Int[]
            t = @register_test(engine, "Context", "ComboClick/ComboClickAll")
            t.GuiFunc = ctx -> begin
                ig.Begin("Window")
                ig.Combo("Combo1", current_combo_item, "One\0Two\0")

                if ig.BeginCombo("Combo2", "")
                    if ig.Selectable("One")
                        push!(selected_combo_items, 1)
                    end
                    if ig.Selectable("Two")
                        push!(selected_combo_items, 2)
                    end

                    ig.EndCombo()
                end
                ig.End()
            end
            t.TestFunc = ctx -> begin
                SetRef("Window")
                ComboClick("Combo1/One")
                @imcheck current_combo_item[] == 0
                ComboClick("Combo1/Two")
                @imcheck current_combo_item[] == 1

                ComboClickAll("Combo2")
                @imcheck selected_combo_items == [1, 2]
            end

            item_checked = Ref(false)
            t = @register_test(engine, "Context", "ItemCheck")
            t.GuiFunc = ctx -> begin
                ig.Begin("Window")
                ig.Checkbox("Check me", item_checked)
                ig.End()
            end
            t.TestFunc = ctx -> begin
                ItemCheck("//Window/Check me")
                @imcheck item_checked[]
            end

            double_clicked = false
            t = @register_test(engine, "Context", "ItemDoubleClick")
            t.GuiFunc = ctx -> begin
                ig.Begin("Window")
                if ig.Selectable("foo", false, ig.ImGuiSelectableFlags_AllowDoubleClick)
                    if ig.IsMouseDoubleClicked(0)
                        double_clicked = true
                    end
                end
                ig.End()
            end
            t.TestFunc = ctx -> begin
                ItemDoubleClick("Window/foo")
                @imcheck double_clicked
            end

            tree1_open = nothing
            tree2_opened = false
            t = @register_test(engine, "Context", "Item opening/closing")
            t.GuiFunc = ctx -> begin
                ig.Begin("Window")
                if ig.TreeNode("Tree1")
                    tree1_open = true
                    ig.TreePop()
                else
                    tree1_open = false
                end

                if ig.TreeNode("Tree2")
                    tree2_opened = true
                    ig.TreePop()
                end

                ig.End()
            end
            t.TestFunc = ctx -> begin
                SetRef("Window")

                @imcheck !tree1_open
                ItemOpen("Tree1")
                @imcheck tree1_open
                ItemClose("Tree1")
                @imcheck !tree1_open

                @imcheck !tree2_opened
                OpenAndClose("Tree2")
                @imcheck tree2_opened
            end

            mouse_clicked = false
            mouse_rightclicked = false
            t = @register_test(engine, "Context", "MouseClick")
            t.GuiFunc = ctx -> begin
                ig.Begin("Window")

                if ig.IsMouseClicked(ig.ImGuiMouseButton_Left)
                    mouse_clicked = true
                end
                if ig.IsMouseClicked(ig.ImGuiMouseButton_Right)
                    mouse_rightclicked = true
                end

                ig.End()
            end
            t.TestFunc = ctx -> begin
                @imcheck !mouse_clicked
                @imcheck !mouse_rightclicked

                MouseClick()
                @imcheck mouse_clicked
                MouseClick(ig.ImGuiMouseButton_Right)
                @imcheck mouse_rightclicked
            end

            is_hovered = false
            t = @register_test(engine, "Context", "MouseMove")
            t.GuiFunc = ctx -> begin
                ig.Begin("Window")
                ig.Button("Button")
                is_hovered = ig.IsItemHovered()
                ig.End()
            end
            t.TestFunc = ctx -> begin
                SetRef("Window")

                @imcheck !is_hovered
                MouseMove("Button")
                @imcheck is_hovered
            end

            mouse_pos = nothing
            t = @register_test(engine, "Context", "MouseMoveToPos")
            t.GuiFunc = ctx -> begin
                ig.Begin("Window")

                mouse_pos = ig.GetMousePos()
                ig.Text("Cursor position: ($(mouse_pos.x), $(mouse_pos.y))")
                ig.End()
            end
            t.TestFunc = ctx -> begin
                SetRef("Window")

                MouseMoveToPos(100, 100)
                @imcheck mouse_pos.x == mouse_pos.y == 100
                MouseMoveToPos(ig.ImVec2(200, 200))
                @imcheck mouse_pos.x == mouse_pos.y == 200
                MouseMoveToPos((300, 300))
                @imcheck mouse_pos.x == mouse_pos.y == 300
            end

            ig.render(ctx; engine) do ; end
        end
    end
end

# We only run the Aqua tests in CI because they're kinda slow
if haskey(ENV, "CI")
    @testset "Aqua.jl" begin
        # We skip the ambiguity tests because we currently have a bazillion
        # ambiguities from the C++ wrappers.
        # TODO: fix the ambiguities.
        Aqua.test_all(te;
                      ambiguities=false,
                      # And we ignore ScopedValues because it won't be loaded on
                      # 1.11+ since it'll be loaded from Base.
                      stale_deps=(; ignore=[:ScopedValues]))
    end
end
