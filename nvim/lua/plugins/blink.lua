return {
	"Saghen/blink.cmp",
	version = "*",
	build = "cargo build --release",

	dependencies = {
		"L3MON4D3/LuaSnip",
		"Saghen/blink.lib",
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
		"timrydefalk/blink-cmp-emoji",
	},

	config = function(_, opts)
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip").filetype_extend("gotmpl", { "html" })
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
		},

		completion = {
			keyword = {
				range = "full",
			},

			trigger = {
				show_on_keyword = true,
				show_on_trigger_character = false,
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
			implementation = "rust",
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
					timeout_ms = 200,
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
