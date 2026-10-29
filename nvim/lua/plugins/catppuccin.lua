return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	opts = {
		flavour = "frappe",
		transparent_background = true,
		integrations = {
			treesitter = true,
			gitsigns = true,
			telescope = {
				enabled = true,
			},
			fidget = true,
			blink_cmp = true,
			native_lsp = {
				enabled = true,
			},
		},
	},
}
