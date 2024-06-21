import Test: @testset, @test, @test_throws
import ImGuiTestEngine as te
import ImGuiTestEngine.lib as lib

import CImGui as ig
import CxxWrap: CxxPtr

import GLFW
import ModernGL
ig.backend = :GlfwOpenGL

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

            te.DestroyContext(engine)
        end

        @testset "GuiFunc/TestFunc" begin
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
                te.lib.ImGuiTestEngine_PostSwap(engine.ptr)
            end

            te.Stop(engine)
            te.DestroyContext(engine)
        end
    end
end
