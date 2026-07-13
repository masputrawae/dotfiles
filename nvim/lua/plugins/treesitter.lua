-- lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "bash",
        "html",
        "go",
        "gotmpl",
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
