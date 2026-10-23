return {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			css = { "prettier" },
			html = { "prettier" },
			markdown = { "prettier" },
		},

		format_on_save = function()
			return {
				timeout_ms = 500,
				lsp_format = "fallback",
			}
		end,
	},
}
