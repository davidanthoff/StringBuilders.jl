using Documenter, StringBuilders

makedocs(
	modules = [StringBuilders],
	sitename = "StringBuilders.jl",
	pages = [
        "Home" => "index.md"
    ]
)

deploydocs(
    repo = "github.com/davidanthoff/StringBuilders.jl.git"
)
