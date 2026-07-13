-- lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { 'neovim-treesitter/treesitter-parser-registry' },
    lazy = false,
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "go",
        "css",
        "scss",
        "javascript",
        "typescript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "tsx",
        "vim",
        "yaml",
        "mdx",
        "gotmpl",
        "templ",
      },

      sync_install = true,
      auto_install = true,

      highlight = {
        enable = true,
      },

      indent = {
        enable = true,
      },

    },
  },
}
