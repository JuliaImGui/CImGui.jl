import CImGui
import Revise
using Documenter
import Changelog

# Revise to catch any docstring changes
Revise.revise()

# Note that the changelog file is named `_changelog.md` so we can use
# `changelog.md` as the generated name, which makes for a prettier URL.
Changelog.generate(
    Changelog.Documenter(),
    joinpath(@__DIR__, "src/_changelog.md"),
    joinpath(@__DIR__, "src/changelog.md"),
    repo="JuliaImGui/CImGui.jl"
)

makedocs(;
    modules=[CImGui],
    authors="Yupei Qi <qiyupei@gmail.com>",
    sitename="CImGui.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://juliaimgui.github.io/CImGui.jl",
        assets=String[],
        size_threshold=2_000_000,
        size_threshold_warn=2_000_000
    ),
    pages=["index.md", "api.md", "backends.md", "makie.md", "changelog.md"]
)

deploydocs(;
    repo="github.com/JuliaImGui/CImGui.jl.git",
)
