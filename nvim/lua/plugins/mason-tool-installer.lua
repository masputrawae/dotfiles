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
			"lua_ls",
			"tailwindcss-language-server",
			"ts_ls",
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
