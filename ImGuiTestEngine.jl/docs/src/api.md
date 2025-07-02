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
    - [`imgui_te_engine.h`](https://github.com/ocornut/imgui_test_engine/blob/main/imgui_test_engine/imgui_te_engine.h)
      (for the engine API)
    - [`imgui_te_context.h`](https://github.com/ocornut/imgui_test_engine/blob/main/imgui_test_engine/imgui_te_context.h)
      (for the test context API)

There are two major parts of the test engine:
- The [`Engine`](@ref) itself. This is the class that executes the tests and
  handles things like interacting with the GUI.
- The [Test context](@ref) API, which is what you'll use to control the GUI and
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
```

```@imguidocs
Class = ImGuiTestEngine
```

### Registering tests
Once the engine is set up you can register some tests for it to run:
```@docs
@register_test
```

```@imguidocs
Class = ImGuiTest
```

Within the tests you will often want to refer to parts of your interface by
[named
reference](https://github.com/ocornut/imgui_test_engine/wiki/Named-References). In
the C++ API this is done with the [`ImGuiTestRef`](@ref) type but with
ImGuiTestEngine.jl you should use either strings or integers and they will
automatically be converted.

## Test context
Inside `GuiFunc` and `TestFunc` you can use any methods of the test context API
to control and test the GUI. It's not safe to use them outside of a
`GuiFunc`/`TestFunc`.

```@docs
@imcheck
@imcheck_noret
OpenAndClose
```

```@imguidocs
Class = ImGuiTestContext
```

## Other

These functions/types are less commonly used than the ones documented above.

### ImGuiTestRef

```@imguidocs
Class = ImGuiTestRef
```

### ImGuiTestRefDesc

```@imguidocs
Class = ImGuiTestRefDesc
```

### ImGuiTestGenericItemStatus

```@imguidocs
Class = ImGuiTestGenericItemStatus
```

### ImGuiTestItemList

```@imguidocs
Class = ImGuiTestItemList
```

### ImGuiPerfTool

```@imguidocs
Class = ImGuiPerfTool
```

`ImGuiPerfToolEntry`:
```@imguidocs
Class = ImGuiPerfToolEntry
```

### ImGuiCaptureContext

```@imguidocs
Class = ImGuiCaptureContext
```

### ImGuiCaptureToolUI

```@imguidocs
Class = ImGuiCaptureToolUI
```

### ImGuiCsvParser

```@imguidocs
Class = ImGuiCsvParser
```

### ImGuiTestLog

```@imguidocs
Class = ImGuiTestLog
```

---

```@imguidocs
Class = <remaining>
```
