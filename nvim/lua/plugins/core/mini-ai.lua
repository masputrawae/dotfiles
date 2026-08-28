-- lua/plugins/mini-ai.lua
return {
  {
    "nvim-mini/mini.ai",
    version = false,
    config = function()
      require("mini.comment").setup()
      require("mini.ai").setup({
         n_lines = 500,
         search_method = "cover_or_next",
      })
    end,
  },
}
