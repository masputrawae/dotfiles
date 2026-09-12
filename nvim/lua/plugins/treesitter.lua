return {
	"romus204/tree-sitter-manager.nvim",
	lazy = false,
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"javascript",
			"typescript",
			"json",
			"bash",
			"python",
			"rust",
      "sql",
		},
		auto_install = true,
	},
}
