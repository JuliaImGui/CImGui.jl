```@meta
CurrentModule = ImGuiTestEngine
CollapsedDocStrings = true
```

# API
!!! note
    We try to document the basics here, but it is not meant as a replacement for
    the upstream documentation. If you need general help we recommend looking at
    the [test engine wiki](https://github.com/ocornut/imgui_test_engine/wiki),
    and possibly at the documentation comments in these header files:
    - [`imgui_te_engine.h`](https://github.com/ocornut/imgui_test_engine/blob/v1.90.8/imgui_test_engine/imgui_te_engine.h)
      (for the engine API)
    - [`imgui_te_context.h`](https://github.com/ocornut/imgui_test_engine/blob/v1.90.8/imgui_test_engine/imgui_te_context.h)
      (for the test context API)

There are two major parts of the test engine:
- The [`Engine`](@ref) itself. This is the class that executes the tests and
  handles things like interacting with the GUI.
- The [`TestContext`](@ref) API, which is what you'll use to control the GUI and
  write the tests.

!!! danger
    For the sake of simplicitly certain parts of the API are not
    memory-safe. This means that some test engine types are wrapped as raw
    pointers that are owned by C++ rather than Julia, which means that using
    them after they have been free'd will cause segfaults. All memory-unsafe
    types are marked as such in their docstrings.

    Because of all that, we recommend using such types only temporarily in the
    style recommended by the upstream examples. This style is good:
    ```julia
    # The test object is never even assigned to a variable
    @register_test(engine, "foo", "bar") do ctx
        ...
    end
    ```

    This style is less good:
    ```julia
    all_tests = []
    t = @register_test(engine, "foo", "bar")
    t.TestFunc = ...

    # Dangerous because it allows `t` to potentially be accessed after the
    # engine has been destroyed.
    push!(all_tests, t)
    ```

Note that in all the examples in the docstrings below we assume that we have
already evaluated:
```julia
import CImGui as ig
using ImGuiTestEngine
import ImGuiTestEngine as te
```

```@contents
Pages = ["api.md"]
Depth = 3
```

---

## Engine
```@docs
Engine
CreateContext
DestroyContext
Start
Stop
TestGroup
TestRunFlags
QueueTest
QueueTests
ShowTestEngineWindows
Base.isassigned(::Engine)
```

### EngineIO
Some engine settings can be configured with [`EngineIO`](@ref):
```@docs
EngineIO
GetIO
TestVerboseLevel
RunSpeed
```

### Registering tests
Once the engine is set up you can register some tests for it to run:
```@docs
ImGuiTest
@register_test
```

## Test context
Inside `GuiFunc` and `TestFunc` you can use any methods of the test context API
to control and test the GUI. It's not safe to use them outside of a
`GuiFunc`/`TestFunc`.

Note that even though `GuiFunc`/`TestFunc` are passed a [`TestContext`](@ref)
object, it's never necessary to pass it explicitly to any of the methods below
because we do some magic to automatically get the right [`TestContext`](@ref) in
the current scope. e.g. `SetRef(ctx, "My window")` is fine, but it'll do the
same thing as `SetRef("My window")`.

!!! note
    Loads of test context methods are missing Julia wrappers, feel free to open
    an issue or contribute them yourself if you're missing one.

    If you want to try calling the wrapped C++ functions directly, it'll
    probably boil down to something like:
    ```julia
    te.lib.Thing(ctx, te.lib.ImGuiTestRef("my ref"))
    ```

```@docs
TestContext
@imcheck
@imcheck_noret
SetRef
GetRef
ItemClick
ItemDoubleClick
ItemCheck
MenuClick
GetWindowByRef
Yield
```
