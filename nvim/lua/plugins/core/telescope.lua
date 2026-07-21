return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    version = '*',
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Telescope Find Files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",  desc = "Telescope Live Grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",    desc = "Telescope Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",  desc = "Telescope Help Tags" },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        winblend = 0,
      },
    },
  },
}
