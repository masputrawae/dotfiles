return {
	cmd = { "htmx-lsp" },
	filetypes = {
		-- html
		"aspnetcorerazor",
		"astro",
		"astro-markdown",
		"blade",
		"clojure",
		"django-html",
		"htmldjango",
		"edge",
		"eelixir", -- vim ft
		"elixir",
		"ejs",
		"erb",
		"eruby", -- vim ft
		"gotmpl",
		"gohtml",
		"gohtmltmpl",
		"haml",
		"handlebars",
		"hbs",
		"html",
		"htmlangular",
		"html-eex",
		"heex",
		"jade",
		"leaf",
		"liquid",
		"markdown",
		"mdx",
		"mustache",
		"njk",
		"nunjucks",
		"php",
		"razor",
		"slim",
		"twig",
		-- js
		"javascript",
		"javascriptreact",
		"reason",
		"rescript",
		"typescript",
		"typescriptreact",
		-- mixed
		"vue",
		"svelte",
		"templ",
	},
	root_markers = { ".git" },
	single_file_support = true,
	on_attach = function(client, bufnr)
		if not client._htmx_intercepted then
			client._htmx_intercepted = true
			local orig_request = client.request
			client.request = function(...)
				local args = { ... }
				local self, method, params, handler, req_bufnr
				if type(args[1]) == "table" and args[1].id == client.id then
					self, method, params, handler, req_bufnr = args[1], args[2], args[3], args[4], args[5]
				else
					self, method, params, handler, req_bufnr = client, args[1], args[2], args[3], args[4]
				end

				if method == "textDocument/completion" and params and params.position then
					local target_buf = req_bufnr or bufnr or vim.api.nvim_get_current_buf()
					local line_idx = params.position.line
					local col = params.position.character
					local line = vim.api.nvim_buf_get_lines(target_buf, line_idx, line_idx + 1, false)[1] or ""

					local token1 = line:sub(1, col):match("[^%s<]*$") or ""
					local token2 = line:sub(1, col + 1):match("[^%s<]*$") or ""

					-- htmx-lsp hanya bisa memproses jika kursor di atribut hx- atau value hx-*="..."
					-- Jika bukan htmx, langsung balas respons kosong agar tidak membuat hang LSP lain di blink.cmp
					local is_htmx = (token1:match("^hx%-[%w_%-]*$") ~= nil)
						or (token1:match("^hx%-[%w_%-]*=[\"'][^\"']*$") ~= nil)
						or (token2:match("^hx%-[%w_%-]*$") ~= nil)
						or (token2:match("^hx%-[%w_%-]*=[\"'][^\"']*$") ~= nil)

					if not is_htmx then
						if handler then
							handler(
								nil,
								{ items = {}, isIncomplete = false },
								{ client_id = self.id, bufnr = target_buf }
							)
						end
						return true, -1
					end
				end
				return orig_request(self, method, params, handler, req_bufnr)
			end
		end
	end,
}
