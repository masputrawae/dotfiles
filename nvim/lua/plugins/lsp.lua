return {

  -- Mason (installer LSP)
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = function()
      require("mason").setup()
    end,
  },

  -- Mason bridge ke lspconfig
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      ensure_installed = {
        "ts_ls",
        "codebook",
        "lua_ls",
        "pyright",
        "gopls",
        "cssls",
        "jsonls",
        "marksman",
        "html",
        "templ",
        "tailwindcss",
      },
    },
  },

  -- LSP
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "saghen/blink.cmp",
    },

    config = function()
      local capabilities =
          require("blink.cmp").get_lsp_capabilities()

      local servers = {
        "ts_ls",
        "codebook",
        "emmet-ls",
        "lua_ls",
        "pyright",
        "gopls",
        "cssls",
        "jsonls",
        "marksman",
        "html",
        "templ",
        "tailwindcss",
      }

      for _, server in ipairs(servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end

      -- Konfigurasi khusus ts_ls dengan root_dir
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        root_dir = require("lspconfig.util").root_pattern(
          "package.json",
          "tsconfig.json",
          ".git"
        ),
        settings = {
          typescript = {
            tsserver = {
              useSeparateSyntaxServer = false,
            },
          },
        },
      })

      vim.lsp.config("templ", {
        capabilities = capabilities,
        filetypes = { "templ" },
      })

      vim.lsp.config("html", {
        capabilities = capabilities,
        filetypes = { "html", "templ" },
      })

      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
        filetypes = { "templ", "astro", "javascript", "typescript", "react" },
        settings = {
          tailwindCSS = {
            includeLanguages = {
              templ = "html",
            },
          },
        },
      })


      vim.lsp.enable(servers)

      -- Keymaps ketika LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, { buffer = args.buf })
          end

          map("n", "gd", vim.lsp.buf.definition)
          map("n", "gD", vim.lsp.buf.declaration)
          map("n", "gi", vim.lsp.buf.implementation)
          map("n", "gr", vim.lsp.buf.references)
          map("n", "K", vim.lsp.buf.hover)

          map("n", "<leader>rn", vim.lsp.buf.rename)
          map("n", "<leader>ca", vim.lsp.buf.code_action)
          map("n", "<leader>f", function()
            vim.lsp.buf.format({ async = false })
          end)
        end,
      })
    end,
  },

  -- Completion
  {
    "saghen/blink.cmp",
    version = "*",
    dependencies = {
      "rafamadriz/friendly-snippets",
      "L3MON4D3/LuaSnip",
    },

    opts = {
      keymap = { preset = "super-tab" },

      appearance = {
        use_nvim_cmp_as_default = false,
        nerd_font_variant = "mono",
      },

      signature = { enabled = true },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      completion = {
        ghost_text = { enabled = true },
      },
    },
  },

}
