return {
	"neovim/nvim-lspconfig",
	dependencies = { "Saghen/blink.cmp" },
	config = function()
		vim.lsp.config("gopls", require("lsp.gopls"))
		vim.lsp.config("lua_ls", require("lsp.lua_ls"))
		vim.lsp.config("sqls", require("lsp.sqls"))
		vim.lsp.config("tsc", require("lsp.tsc"))
		vim.lsp.config("htmx", require("lsp.htmx"))
		vim.lsp.config("html", require("lsp.html"))
		vim.lsp.config("emmet_language_server", require("lsp.emmet_language_server"))
		vim.lsp.config("tailwindcss", require("lsp.tailwindcss"))

		vim.lsp.enable("gopls")
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("sqls")
		vim.lsp.enable("tsc")
		vim.lsp.enable("htmx")
		vim.lsp.enable("html")
		vim.lsp.enable("emmet_language_server")
		vim.lsp.enable("tailwindcss")

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("UserLspConfig", {}),
			callback = function(ev)
				vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"
				local opts = function(desc)
					return {
						buffer = ev.buf,
						silent = true,
						desc = desc,
					}
				end
				vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
				vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover documentation"))
				vim.keymap.set("n", "<leader><space>", vim.lsp.buf.hover, opts("Hover documentation"))
				vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
				vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts("Go to type definition"))
				vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename symbol"))
				vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
				vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("Find references"))
				vim.keymap.set("n", "<leader>f", function()
					require("conform").format({ async = true, lsp_format = "fallback" })
				end, opts("Format buffer"))
				vim.keymap.set("n", "<leader>d", function()
					vim.diagnostic.open_float({
						border = "rounded",
					})
				end, opts("Show diagnostics float"))
			end,
		})
	end,
}
