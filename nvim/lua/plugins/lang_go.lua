-- lua/plugins/lang/go.lua
return {
  {
    "ray-x/go.nvim",
    dependencies = { "ray-x/guihua.lua" },
    lazy = true,
    ft = { "go" },
    config = function()
      require("go").setup({
        run_in_floaterm = false,
        gofmt = "gofmt",
        lsp_cfg = true,
        lsp_gofumpt = true,
        lsp_on_attach = true,
        lsp_diag_hdlr = true,
        dap_debug = true,
        dap_debug_keymap = true,
      })
    end,
  },
}
