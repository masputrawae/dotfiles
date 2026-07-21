-- lua/plugins/mini-ai.lua
return {
  {
    "nvim-mini/mini.ai",
    version = false, -- false untuk menggunakan branch main, atau "stable" untuk versi stabil
    config = function()
      require("mini.comment").setup()
      require("mini.ai").setup({
         n_lines = 500,
         search_method = "cover_or_next",
      })
    end,
  },
}
