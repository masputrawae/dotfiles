return {
	"WhoIsSethDaniel/mason-tool-installer.nvim",

	dependencies = {
		"mason-org/mason.nvim",
	},

	opts = {
		ensure_installed = {
			"stylua",
			"prettierd",
			"eslint",
			"tailwindcss-language-server",
			"gopls",
			"sqls",
			"jsonls",
			"yamlls",
			"biome",
		},

		auto_update = true,
		run_on_start = true,
	},
}
