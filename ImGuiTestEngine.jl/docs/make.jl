import Revise
import Documenter: Remotes, HTML, makedocs, deploydocs
import Changelog
import ImGuiTestEngine
import DocumenterInterLinks: InterLinks


# Explicitly call Revise to update changes to the docstrings
Revise.revise()

# Build the changelog
Changelog.generate(
    Changelog.Documenter(),
    joinpath(@__DIR__, "src/_changelog.md"),
    joinpath(@__DIR__, "src/changelog.md"),
    repo="JuliaImGui/ImGuiTestEngine.jl"
)

links = InterLinks(
    "CImGui" => "https://juliaimgui.github.io/ImGuiDocs.jl/cimgui/stable/"
)

makedocs(;
         repo = Remotes.GitHub("JuliaImGui", "ImGuiTestEngine.jl"),
         sitename = "ImGuiTestEngine",
         format = HTML(; prettyurls=get(ENV, "CI", "false") == "true"),
         pages = [
             "index.md",
             "api.md",
             "changelog.md"
         ],
         modules = [ImGuiTestEngine],
         plugins = [links]
         )

deploydocs(; repo="github.com/JuliaImGui/ImGuiTestEngine.jl.git")
