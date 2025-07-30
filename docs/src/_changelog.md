```@meta
CurrentModule = CImGui
```

# Changelog
This documents notable changes in CImGui.jl. The format is based on [Keep a
Changelog](https://keepachangelog.com).

## [v6.1.0] - 2025-07-30

### Changed
- We updated to [Dear ImGui
  1.92.1](https://github.com/ocornut/imgui/releases/tag/v1.92.1) ([#177]). There
  should be no breaking changes.

## [v6.0.0] - 2025-07-07

### Changed
- **Breaking**: We updated to [Dear ImGui
  1.92](https://github.com/ocornut/imgui/releases/tag/v1.92.0) ([#176]). All
  the changes from 1.91.9, 1.91.9b, and 1.92 apply to the release. 1.92 is
  particularly breaking so read the changelog carefully. The most breaking is
  likely to the `[Add]Image*` functions which now take an
  [`ImTextureRef`](@ref) instead of an `ImTextureID`.
- **Breaking**: The
  `create_image_texture()`/`update_image_texture()`/`destroy_image_texture()`
  helper functions have been changed to work with `ImTextureRef` objects instead
  of `ImTextureID`. If you're using these functions it should simplify
  upgrading.

## [v5.1.2] - 2025-06-13

### Changed
- When possible the GLFW/OpenGL backend will now enter GC-safe regions in the
  eventloop to avoid blocking the GC ([#174]). This should improve performance
  in some situations since the GC will be able to run concurrently with GLFW
  during certain blocking calls.

### Fixed
- Fixed compatibility with the latest GLFW/GLMakie ([#174]).

## [v5.1.1] - 2025-03-10

### Fixed
- Fixed compat bounds with GLMakie, currently we're restricted to <0.11.3 ([#169]).

## [v5.1.0] - 2025-02-19

### Added
- Added an option to call WaitEvents() instead of PollEvents() in render loop ([#166]).
  You can use it by passing keyword argument `wait_events=true` in function [`render()`](@ref)

## [v5.0.1] - 2025-02-17

### Changed
- Added precompilation workloads for the GLFW/OpenGL backend and the Makie
  extension ([#165]). This reduced the execution time of some tests involving the
  GLFW/OpenGL backend from ~2.5s to ~1.8s, and the execution time of the Makie
  integration tests from ~15s to ~5s.

  It is possible that the workloads are not portable: if you get a
  precompilation error please report it as a bug with the error message. The
  precompilation workloads can be disabled completely [using the PrecompileTools
  preferences](https://julialang.github.io/PrecompileTools.jl/stable/#Package-developers:-reducing-the-cost-of-precompilation-during-development).

## [v5.0.0] - 2025-02-05

### Changed
- **Breaking**: We updated to [Dear ImGui
  1.91.8](https://github.com/ocornut/imgui/releases/tag/v1.91.8) ([#163]). All the
  changes from 1.91.7 and 1.91.8 apply to this release.

### Fixed
- Fixed compatibility with the Makie v0.22 ([#163]).

## [v4.0.0] - 2024-12-21

### Changed
- **Breaking**: We updated to [Dear ImGui
  1.91.6](https://github.com/ocornut/imgui/releases/tag/v1.91.6) ([#157]). All
  the changes from 1.91.3 through to 1.91.6 apply to this release. Here's a
  non-exhaustive list of changes:
  - `ImTextureID` is now an unsigned integer instead of a pointer. You should
    replace any calls to e.g. `ig.Image(Ptr{Cvoid}(tex), ...)` with
    `ig.Image(ig.ImTextureID(tex), ...)`.
  - `ig.ImGuiConfigFlags_NavEnableSetMousePos` and
    `ig.ImGuiConfigFlags_NavNoCaptureKeyboard` were replaced with
    `ImGuiIO.ConfigNavMoveSetMousePos` and `ImGuiIO.ConfigNavCaptureKeyboard`
    respectively.

  For Linux/GLFW users, there's also a fix for a long-standing docking bug:
  <https://github.com/ocornut/imgui/issues/7733>

## [v3.1.1] - 2024-11-05

### Fixed
- Deleted some deprecated bindings that were accidentally overwriting the
  automatically generated ones ([#153]). This should fix segfaults on ARM.

## [v3.1.0] - 2024-10-08

### Changed
- Updated to [Dear ImGui
  1.91.2](https://github.com/ocornut/imgui/releases/tag/v1.91.2), which
  shouldn't have any breaing changes [(#152)]. We didn't bother going with
  1.91.3 because that does have some breaking changes.

## [v3.0.0] - 2024-09-11

### Added
- [`HelpMarker()`](@ref), a port of the same function from the Dear ImGui demo
  ([#139]).

### Changed
- Simplified the [Makie integration](@ref) by requiring the latest GLMakie
  version ([#142]).
- **Breaking**: We upgraded to [Dear ImGui
  1.91.1](https://github.com/ocornut/imgui/releases/tag/v1.91.1). All the
  breaking changes listed there and for [Dear ImGui
  1.91.0](https://github.com/ocornut/imgui/releases/tag/v1.91.0) apply to this
  release.
- **Breaking**: We now generate the high-level Julia wrappers automatically
  ([#141]), which is far easier to maintain but it's possible that some
  functions will have changed signatures or been renamed. Here's a
  (non-exhaustive) list of known changes:
  - [`Combo()`](@ref) no longer requires passing the length of `items`.
  - The old `Value*()` functions are now just named [`Value()`](@ref) and use
    dispatch to select the right ImGui function to call.
  - The `Combo()` and `ListBox()` methods that allowed passing a function to
    generate the items are not wrapped. They may be wrapped in the future.

  If you encounter any other breakages please open an issue, it could be a bug
  in the wrappers.
- **Possibly breaking**: [`render()`](@ref) would previously run on whatever
  task and thread it was called on, but with multiple threads that could cause
  issues if the task migrated. It now defaults to being pinned to thread 1 and
  there's a couple new keyword arguments, `spawn` and `wait`, to control the
  task pinning and wait behaviour ([#138]). This is technically breaking because
  any old code that set up [`render()`](@ref) to run on a specific thread by
  task pinning won't work, to get back the old behaviour pass `spawn=false`.

## [v2.3.0] - 2024-08-06

### Added
- The [Makie integration](@ref) now supports displaying rendering statistics,
  and has a context menu to change simple plot settings ([#137]). This will be
  made more customizeable in the future.

### Fixed
- Fixed a number of bugs in the Makie integration ([#137]).

### Changed
- Upon loading the Makie extension, the default Makie theme will be set to one
  that matches ImGui's default dark theme ([#137]).
- The GLFW/OpenGL renderloop will now `yield()` after every drawing iteration
  ([#137]). This makes it play a little nicer with Julia's event loop.
- **Breaking**: Previously [`MakieFigure()`](@ref) would return a `Bool` to
  indicate if the figure was rendered or not, now it returns `nothing`
  ([#137]).

  *Reminder that the [Makie integration](@ref) is not yet covered by semver.*

## [v2.2.0] - 2024-08-02

### Added
- Support for more GLMakie controls, and a tooltip for each figure by default
  ([#134]).

## [v2.1.0] - 2024-07-29

### Added
- The OpenGL version can now be set with [`render()`](@ref).
- Experimental [Makie integration](@ref) ([#133]).

## [v2.0.0] - 2024-06-27

Note: this release has particularly many breaking changes, please file an issue
or submit a pull request if something isn't working.

### Added
- A renderloop for the OpenGL/GLFW backend has been added to CImGui, so it's no
  longer necessary to copy and paste the examples around.
- The renderloop also integrates with the new
  [ImGuiTestEngine.jl](https://github.com/JuliaImGui/ImGuiTestEngine.jl) to make
  it possible to write automated tests.

### Changed
- CImGui.jl now uses semantic versioning to make development easier. This
  release is based on [Dear ImGui
  1.90.8](https://github.com/ocornut/imgui/releases/tag/v1.90.8).
- **Breaking**: LibCImGui.jl has been merged into `CImGui.lib`, again for the
  sake of ease of development.
- **Breaking**: The custom backends that we developed,
  [ImGuiOpenGLBackend.jl](https://github.com/JuliaImGui/ImGuiOpenGLBackend.jl)
  and [ImGuiGLFWBackend.jl](https://github.com/JuliaImGui/ImGuiGLFWBackend.jl),
  have been deprecated in favour of using ImGui's official backends. With this
  change we also dropped support for OpenGL 2, but purely out of laziness. If
  you need OpenGL 2 let us know and we can build and ship the official OpenGL 2
  backend.
- **Breaking**: The built-in renderloop is implemented using package extensions,
  which are only available on Julia 1.9+. Hence the new minimum required Julia
  version is 1.9.

### Deprecated
- `GetKeyIndex()` has been [deprecated
  upstream](https://github.com/ocornut/imgui/blob/6d948ab47ecf984239af01434f3ed03808dbf188/imgui.h#L3532). It
  will be removed in a future release.

## [v1.89.1] - 2024-05-19

### Fixed
- Fixed the implementations of [SetScrollX()](@ref) and [SetScrollY()](@ref) ([#115]).
