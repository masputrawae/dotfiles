return {
	"ray-x/go.nvim",

	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
	},

	ft = { "go", "gomod" },

	opts = {
		lsp_keymaps = true,
	},

	build = ":lua require('go.install').update_all_sync()",
}
