```@meta
CurrentModule = ImGuiTestEngine
```

# Changelog

This documents notable changes in ImGuiTestEngine.jl. The format is based on
[Keep a Changelog](https://keepachangelog.com).

## [v1.0.0]

### Changed
- **Breaking**: the package changed being mostly handwritten wrappers to mostly
  auto-generated wrappers, and so now the API much more closely mimics the
  upstream API, but there will also be breakages.
- **Breaking**: the `GuiFunc` and `TestFunc` functions no longer take a `ctx`
  argument. You will need to replace code like `t.GuiFunc = ctx -> ...` with
  `t.GuiFunc = () -> ...` and `@register_test(engine, "foo", "bar") do ctx
  ... end` with `@register_test(engine, "foo", "bar") do ... end`.
- **Breaking**: we also updated to the test engine for Dear ImGui 1.92, which has
  some of [its own breaking
  changes](https://github.com/ocornut/imgui_test_engine/blob/0406f8a96068155ad7b30d4d632ae287f7a4389f/docs/CHANGELOG.txt#L11).

## [v0.1.7] - 2025-02-05

Patch release to add compat for CImGui v5/Dear ImGui 1.91.8 ([#13]).

## [v0.1.6] - 2025-02-01

### Added
- Bindings for [`MouseMoveToPos()`](@ref) ([#12]).

## [v0.1.5] - 2024-12-19

Patch release to actually add compat for CImGui v4 ([#9]).

## [v0.1.4] - 2024-11-19

Patch release to fix compat for CImGui v4/Dear ImGui 1.91.5 ([#8]).

## [v0.1.3] - 2024-10-08

Patch release to add compat for CImGui v3.1/Dear ImGui 1.91.2 ([#7]).

## [v0.1.2] - 2024-09-09

Patch release to fix compat for CImGui v3/Dear ImGui 1.91.1 ([#6]).

## [v0.1.1] - 2024-09-03

This release is compatible with CImGui.jl v2 and v3.

### Added
- Bindings for [`ComboClick()`](@ref) and [`ComboClickAll()`](@ref) ([#4]).
- Bindings for [`MouseClick()`](@ref), [`MouseMove()`](@ref),
  [`ItemOpen()`](@ref), [`ItemClose()`](@ref), and a helper
  [`OpenAndClose()`](@ref) ([#5]).

### Changed
- [`ItemClick()`](@ref) now supports passing a `button` argument to select which
  button to click ([#5]).

## [v0.1.0] - 2024-06-27

The initial release!
