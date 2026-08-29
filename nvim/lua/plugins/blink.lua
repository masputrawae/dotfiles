return {
	"Saghen/blink.cmp",

	dependencies = {
		"L3MON4D3/LuaSnip",
		"Saghen/blink.lib",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"timrydefalk/blink-cmp-emoji",
	},

	config = function(_, opts)
		require("luasnip.loaders.from_vscode").lazy_load()
		require("blink.cmp").setup(opts)
	end,

	opts = {
		snippets = {
			preset = "luasnip",
		},
		keymap = {
			preset = "default",

			["<C-Space>"] = { "show", "fallback" },
			["<C-e>"] = { "cancel", "fallback" },

			["<C-b>"] = {
				"scroll_documentation_up",
				"fallback",
			},

			["<C-f>"] = {
				"scroll_documentation_down",
				"fallback",
			},

			["<CR>"] = {
				"accept",
				"fallback",
			},

			["<Tab>"] = {
				"select_next",
				"snippet_forward",
				"fallback",
			},

			["<S-Tab>"] = {
				"select_prev",
				"snippet_backward",
				"fallback",
			},

			["<S-j>"] = {
				"select_next",
				"fallback",
			},

			["<S-k>"] = {
				"select_prev",
				"fallback",
			},
		},

		completion = {
			keyword = {
				range = "full",
			},
			menu = {
				auto_show = true,

				draw = {
					treesitter = { "lsp" },

					columns = {
						{
							"kind_icon",
							"label",
							"label_description",
							gap = 1,
						},
						{ "kind" },
					},
				},
			},

			documentation = {
				auto_show = true,
			},
		},

		signature = {
			enabled = true,
		},

		fuzzy = {
			implementation = "lua",
			sorts = {
				"exact",
				"score",
				"sort_text",
			},
		},

		sources = {
			default = {
				"lsp",
				"path",
				"snippets",
				"buffer",
				"emoji",
			},

			per_filetype = {
				sql = {
					"lsp",
					"snippets",
					"buffer",
				},
			},

			providers = {
				lsp = {
					score_offset = 100,
				},
				emoji = {
					module = "blink-cmp-emoji",
					name = "blink-cmp-emoji",
					max_items = 10,
					min_keyword_length = 1,
					score_offset = 10,
					opts = {
						trigger = ":",
					},
				},
			},
		},
	},
}
