```@meta
CurrentModule = ImGuiTestEngine
```

# Changelog

This documents notable changes in ImGuiTestEngine.jl. The format is based on
[Keep a Changelog](https://keepachangelog.com).

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
