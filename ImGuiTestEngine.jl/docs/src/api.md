```@meta
CurrentModule = ImGuiTestEngine
```

# API

There are two major parts of the test engine:
- The [`Engine`](@ref) itself. This is the class that executes the tests and
  handles things like interacting with the GUI.
- The [`TestContext`](@ref), which is what you'll use to write the actual
  tests.

!!! danger
    For the sake of simplicitly certain parts of the API are not
    memory-safe. This means that some test engine types are wrapped as raw
    pointers that are owned by C++ rather than Julia, which means that using
    them after they have been free'd will cause segfaults. All memory-unsafe
    types are marked as such in their docstrings.
    
    Because of this, we recommend using such types only temporarily in the style
    recommended by the upstream documentation. This style is good:
    ```julia
    t = @register_test(engine, "foo", "bar")
    t.TestFunc = ...
    
    # `t` is never used again
    ```
    
    This style is bad:
    ```julia
    all_tests = []
    t = @register_test(engine, "foo", "bar")
    t.TestFunc = ...

    # Dangerous because it allows `t` to potentially be accessed after the
    # engine has been destroyed.
    push!(all_tests, t)
    ```

## Engine

```@docs
Engine
CreateContext
DestroyContext
Start
Stop
Base.isassigned(::Engine)
```

---

Some engine settings can be configured with [`EngineIO`](@ref):
```@docs
EngineIO
GetIO
```

---

Once the engine is set up you can create some tests:
```@docs
ImGuiTest
@register_test
```

## Test context
```@docs
TestContext
SetRef
ItemClick
```
