```@meta
CurrentModule = ImGuiTestEngine
```

# Changelog

This documents notable changes in ImGuiTestEngine.jl. The format is based on
[Keep a Changelog](https://keepachangelog.com).

## [v1.0.0] - 2024-09-03

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
