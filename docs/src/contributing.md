# Contributing
CImGui.jl uses
[`CImGuiPack_jll`](https://github.com/JuliaPackaging/Yggdrasil/blob/master/C/CImGuiPack/build_tarballs.jl)
internally, which is a single JLL that bundles:
- [cimgui](https://github.com/cimgui/cimgui)
- [cimplot](https://github.com/cimgui/cimplot)
- [cimnodes](https://github.com/cimgui/cimnodes)
- [cimgui\_test\_engine](https://github.com/JuliaImGui/cimgui_test_engine)

`CImGuiPack_jll` is built from
[cimgui-pack](https://github.com/JuliaImGui/cimgui-pack), which is a repo that
bundles all the other repositories as submodules checked out at the right
commits, along with a build script to ensure that the C wrappers are built with
the right flags.

CImGui.jl uses the bindings metadata files to generate two kinds of wrappers:
- Low-level, per-platform [wrappers in
  `lib/`](https://github.com/JuliaImGui/CImGui.jl/tree/master/lib). These
  directly wrap their C counterparts and are generated for each supported Julia
  platform for portability. The appropriate file is `include()`'d at runtime
  depending on the platform.
- High-level [wrappers in
  `src/wrapper.jl`](https://github.com/JuliaImGui/CImGui.jl/blob/master/src/wrapper.jl)
  that call the low-level wrappers. Among other things, the high-level wrappers
  have:
  - Automatically generated docstrings.
  - Cleaned up function names (e.g. `igImage` -> `Image`).
  - Default arguments.
  - More flexible argument type annotations
    (e.g. `Union{String, Ptr{Cchar}, Ptr{Cvoid}}` for string arguments).
    
All the generated code is produced by
[`gen/generator.jl`](https://github.com/JuliaImGui/CImGui.jl/blob/master/gen/generator.jl)
with Clang.jl. ImPlot.jl and ImGuiTestEngine.jl are also consumers of
`CImGuiPack_jll` and have similar generator scripts.

## Updating to newer upstream versions
We typically only update CImGui.jl and friends on every second Dear ImGui
release (patch or feature), for a few reasons:
- Dear ImGui is pretty solid already, so it's rare that a critical bug is fixed
  in a new release that should get pushed out quickly.
- Dear ImGui makes breaking changes of varying severity in almost every release
  (patch or feature) and the Julia packages follow semver. Updating for each
  upstream release would be a lot of breaking versions for potentially little
  benefit.
- Laziness (this is the most important reason).

Here are the steps to update CImGui.jl and friends:
1. Pick a Dear ImGui release to update to and ensure that cimgui, cimplot, and
   cimnodes have all been updated for that release. Sometimes it will not be
   necessary for cimplot and cimnodes to have been updated if nothing relevant
   changed in Dear ImGui.
1. Regenerate the
   [cimgui\_test\_engine](https://github.com/JuliaImGui/cimgui_test_engine)
   bindings for the chosen Dear ImGui release. The test engine repo has [tags for
   each Dear ImGui release](https://github.com/ocornut/imgui_test_engine/tags)
   which you should use. Update the `cimgui` and `imgui_test_engine` submodules
   appropriately, and then run the `generate_bindings.jl` script to update the C
   bindings. Commit and tag the changes.
1. Clone [cimgui-pack](https://github.com/JuliaImGui/cimgui-pack) and update all
   the submodules to the appropriate commits, then run `build.jl` to regenerate
   the bindings with all needed metadata and to test that everything
   compiles. Commit and tag the changes.

   !!! note
       The submodules have their own nested submodules (e.g. `cimplot/implot`),
       so after checking out a new commit in a submodule run `git submodule
       update --init --recursive` inside it.

   !!! tip
       Before committing and tagging the changes, you can test them locally by
       building `CImGuiPack_jll`. See the next step for details.
1. Update the
   [`build_tarballs.jl`](https://github.com/JuliaPackaging/Yggdrasil/blob/master/C/CImGuiPack/build_tarballs.jl)
   script to clone the new version of `cimgui-pack` and bump the version
   number. Make a PR to Yggdrasil with the changes.
   
   !!! tip
       Before making the Yggdrasil PR, build it locally to test. e.g. on a 64bit
       Linux machine with BinaryBuilder installed in the `@bb` project:
       ```bash
       julia --project=@bb build_tarballs.jl x86_64-linux-gnu --deploy=local --verbose --debug
       ```

       You can also test it with your local changes to `cimgui-pack` by tweaking
       `build_tarballs.jl` a bit:
       1. Replace the `GitSource` with `DirectorySource("/path/to/cimgui-pack")`.
       1. Change the first few lines of the build script to only `cd` into the
          source directory:
          ```diff
          -cd $WORKSPACE/srcdir/cimgui-pack
          -git submodule update --init --recursive --depth 1
          +cd $WORKSPACE/srcdir
          ```
       1. Delete any existing `build/` directory in your `cimgui-pack` clone,
          otherwise the script will error when it tries to write to it.

    **At this point you should have a working build of `CImGuiPack_jll`.**

1. Update [the `gen/`
   project](https://github.com/JuliaImGui/CImGui.jl/tree/master/gen) for
   CImGui.jl to use the new JLL, and run the `generator.jl` script. If you've
   built the JLL locally then you can use it by running `] dev
   CImGuiPack_jll`. Update the `CImGuiPack_jll` compat bounds for
   CImGui. Try importing CImGui to check that it at least precompiles.

1. Follow the same generation process for ImGuiTestEngine.jl, which lives in
   the
   [`ImGuiTestEngine.jl/`](https://github.com/JuliaImGui/CImGui.jl/tree/master/ImGuiTestEngine.jl)
   subdirectory and has its own [`gen/`
   project](https://github.com/JuliaImGui/CImGui.jl/tree/master/ImGuiTestEngine.jl/gen).
   Also update `te_version` in `gen/generator.jl` (used for the upstream links
   in docstrings). The test engine is very stable so in most cases it's possible
   to preserve backwards compatibility with older JLLs.
1. Run the ImGuiTestEngine and CImGui tests. Their tests depend on each other,
   but their `Project.toml`'s already have `[sources]` entries pointing to the
   local copy of the other package, so the only thing you need to `] dev` is the
   JLL (in both the ImGuiTestEngine and CImGui projects).

   **At this point both the CImGui and ImGuiTestEngine tests should pass.**
1. As before you will need to update [the `gen/`
   project](https://github.com/JuliaImGui/ImPlot.jl/tree/main/gen) to use the
   new JLL. Then call the `generate()` function in `generator.jl`. Update the
   compat bounds for `CImGuiPack_jll`.
1. Run `] dev CImGui` in ImPlot's Project.toml and `] dev ImGuiTestEngine` in
    ImPlot's `test/Project.toml` to ensure that the right dependencies are
    used. Then run the ImPlot tests.
1. If all pass, then it's time to make PRs and releases! In order:
   1. Yggdrasil PR for `CImGuiPack_jll`.
   1. A CImGui.jl PR containing both the CImGui and ImGuiTestEngine
      changes. After merging, register CImGui first and then ImGuiTestEngine
      (with `@JuliaRegistrator register subdir=ImGuiTestEngine.jl`), since
      ImGuiTestEngine may depend on the new CImGui version.
   1. ImPlot.
