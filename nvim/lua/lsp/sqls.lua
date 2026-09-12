return {
	cmd = { "sqls" },
	filetypes = { "sql" },
	root_markers = { "config.yml" },

	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
		client.server_capabilities.documentRangeFormattingProvider = true
	end,
}

