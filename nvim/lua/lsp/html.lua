return {
	cmd = { "vscode-html-language-server", "--stdio" },
	filetypes = { "html", "templ", "gotmpl" },
	init_options = {
		configurationSection = { "html", "css", "javascript" },
		embeddedLanguages = {
			css = true,
			javascript = true,
		},
		provideFormatter = true,
	},
}
