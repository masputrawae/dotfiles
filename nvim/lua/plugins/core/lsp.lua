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
            package_installed   = "✅",
            package_pending     = "⏳",
            package_uninstalled = "❌",
          },
        },
      })
    end,
  },

  -- Mason-LSPConfig: memastikan server LSP terinstal
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = lsp_servers,
        automatic_installation = true,
      })
    end,
  },

  -- nvim-lspconfig (sebenarnya kita pakai API bawaan vim.lsp, tetapi tetap butuh plugin untuk
  -- integrasi dengan mason, meskipun kita tidak memanggil lspconfig.setup)
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

      require("mason-lspconfig").setup({
        handlers = {
          function(server_name)
            if lspconfig[server_name] then
              lspconfig[server_name].setup({
                capabilities = capabilities,
              })
            end
          end,
        },
      })

      -- cara di bawah ini kurang stabil. jadi pakai cara di atas saja
      -- for _, server in ipairs(lsp_servers) do
      -- vim.lsp.config(server, {
      --  capabilities = capabilities,
      -- })
      -- end
      -- vim.lsp.enable(lsp_servers)

      -- Keymaps yang dipasang saat LSP terattach ke buffer
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
}
