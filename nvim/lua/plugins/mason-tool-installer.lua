return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",

  dependencies = {
    "mason-org/mason.nvim",
  },

  opts = {
    ensure_installed = {
      "lua-language-server",
      "stylua",
      "html-lsp",
      "emmet-language-server",
      "tailwindcss-language-server",
      "htmx-lsp",
      "sqls",
      "prettier",
    },
    auto_update = true,
    run_on_start = true,
  },
}
