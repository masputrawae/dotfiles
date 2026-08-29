return {
	"ray-x/go.nvim",

	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		{
			"nvim-treesitter/nvim-treesitter",
			branch = "main",
		},
	},

	ft = { "go", "gomod" },

	opts = {
		lsp_keymaps = true,
	},

	config = function(_, opts)
		require("go").setup(opts)
		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			group = format_sync_grp,
			callback = function()
				require("go.format").goimports()
			end,
		})
	end,
	build = ":lua require('go.install').update_all_sync()",
}
