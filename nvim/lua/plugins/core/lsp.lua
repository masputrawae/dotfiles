-- Daftar server yang akan dipasang
local lsp_servers = {
  "lua_ls",
  "ts_ls",
  "pyright",
  "gopls",
  "codebook",
  "emmet_ls",
  "rust_analyzer",
  "cssls",
  "tailwindcss",
  "jsonls",
  "marksman",
  "html",
  "htmx",
  "templ",
  "astro",
}

return {
  -- Mason: manajer pemasangan tools
  {
    "mason-org/mason.nvim",
    build = ":MasonUpdate",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    config = function()
      require("mason").setup({
        ui = {
          border = "rounded",
          icons = {
            package_installed = "✅",
            package_pending = "⏳",
            package_uninstalled = "❌",
          },
        },
      })
    end,
  },

  -- Mason-LSPConfig
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = {
      "mason-org/mason.nvim",
    },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = lsp_servers,
        automatic_installation = true,
      })
    end,
  },

  -- nvim-lspconfig dengan API Neovim 0.11+
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },

    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Konfigurasi umum semua LSP
      for _, server in ipairs(lsp_servers) do
        vim.lsp.config(server, {
          capabilities = capabilities,
        })
      end

      vim.lsp.config("html", {
        capabilities = capabilities,
        filetypes = {
          "templ",
          "html",
        },
      })

      vim.lsp.config("templ", {
        capabilities = capabilities,
        filetypes = {
          "templ",
        },
      })

      vim.lsp.config("htmx", {
        capabilities = capabilities,
        filetypes = {
          "templ",
          "html",
        },
      })

      -- Aktifkan semua LSP
      vim.lsp.enable(lsp_servers)


      -- Keymaps saat LSP attach
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local map = function(mode, lhs, rhs)
            vim.keymap.set(mode, lhs, rhs, {
              buffer = args.buf,
              silent = true,
            })
          end

          map("n", "gd", vim.lsp.buf.definition)
          map("n", "gD", vim.lsp.buf.declaration)
          map("n", "gi", vim.lsp.buf.implementation)
          map("n", "gr", vim.lsp.buf.references)
          map("n", "K", vim.lsp.buf.hover)
          map("n", "<leader>rn", vim.lsp.buf.rename)
          map("n", "<leader>ca", vim.lsp.buf.code_action)

          map("n", "<leader>f", function()
            vim.lsp.buf.format({
              async = false,
            })
          end)
        end,
      })
    end,
  },
}
