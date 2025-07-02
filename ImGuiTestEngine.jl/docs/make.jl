import Revise
import JSON3
using Documenter.Builder: DocumentPipeline
using Documenter: Remotes, HTML, makedocs, deploydocs, Selectors
import MarkdownAST
import Changelog
import ImGuiTestEngine
import DocumenterInterLinks: InterLinks


# This is a helper Selector that behaves in a similar way to @autodocs, except
# that each block selects a single class/group of symbols and the symbols are
# inserted in order.
abstract type ImGuiDocs <: DocumentPipeline end

Selectors.order(::Type{ImGuiDocs}) = 2.0

function Selectors.runner(::Type{ImGuiDocs}, doc)
    metadata = open(f -> JSON3.read(f, Dict{String, Any}), joinpath(@__DIR__, "wrapper_metadata.json"))
    documented_symbols = Set{String}()

    for page in values(doc.blueprint.pages)
        replace!(page.mdast) do node
            if !(node.element isa MarkdownAST.CodeBlock && node.element.info == "@imguidocs")
                return node
            end

            config = Dict{String, String}()
            for line in eachline(IOBuffer(node.element.code))
                parts = split(line, "=")
                config[strip(parts[1])] = strip(parts[2])
            end

            class_methods = if config["Class"] == "<remaining>"
                filter(kv -> kv.first ∉ documented_symbols, metadata)
            else
                filter(kv -> kv.second["class"] == config["Class"], metadata)
            end

            sorted_funcs = sort(collect(keys(class_methods)); by=k -> class_methods[k]["line"])
            union!(documented_symbols, sorted_funcs)

            x = join(sorted_funcs, "\n")

            MarkdownAST.Node(MarkdownAST.CodeBlock("@docs", x))
        end
    end
end

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
         format = HTML(; prettyurls=get(ENV, "CI", "false") == "true",
                       size_threshold=2_000_000,
                       size_threshold_warn=2_000_000),
         pagesonly = true,
         warnonly = [:missing_docs],
         pages = [
             "index.md",
             "api.md",
             "changelog.md"
         ],
         modules = [ImGuiTestEngine],
         plugins = [links]
         )

deploydocs(; repo="github.com/JuliaImGui/ImGuiTestEngine.jl.git")
