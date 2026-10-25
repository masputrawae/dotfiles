return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master", -- 👈 Kunci penyelesaiannya ada di sini
	lazy = false,
	build = ":TSUpdate",
	opts = {
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"query",
			"javascript",
			"typescript",
			"html",
			"css",
			"json",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"rust",
			"sql",
			"go",
			"gotmpl",
			"make",
		},
		auto_install = true,
		highlight = {
			enable = true,
		},
		incremental_selection = { enable = true },
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)
	end,
}
