return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    version = "*",

    keys = {
      {
        "<leader>ff",
        function()
          require("telescope.builtin").find_files({
            cwd = vim.fn.getcwd(),
            hidden = true,
            no_ignore = false,
            find_command = {
              "rg",
              "--files",
              "--hidden",
              "--color=never",
              "--glob", "!.git/**",
              "--glob", "!node_modules/**",
              "--glob", "!.bun/**",
              "--glob", "!.svelte-kit/**",
              "--glob", "!dist/**",
              "--glob", "!build/**",
            },
          })
        end,
        desc = "Telescope Find Files",
      },

      {
        "<leader>fg",
        function()
          require("telescope.builtin").live_grep({
            cwd = vim.fn.getcwd(),
            additional_args = function()
              return {
                "--hidden",
                "--glob", "!.git/**",
                "--glob", "!node_modules/**",
                "--glob", "!.bun/**",
                "--glob", "!.svelte-kit/**",
                "--glob", "!dist/**",
                "--glob", "!build/**",
              }
            end,
          })
        end,
        desc = "Telescope Live Grep",
      },

      { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Telescope Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Telescope Help Tags" },
    },

    opts = {
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
        winblend = 0,
      },

      pickers = {
        find_files = {
          hidden = true,
          no_ignore = false,
          find_command = {
            "rg",
            "--files",
            "--hidden",
            "--color=never",
            "--glob", "!.git/**",
            "--glob", "!node_modules/**",
            "--glob", "!.bun/**",
            "--glob", "!.svelte-kit/**",
            "--glob", "!dist/**",
            "--glob", "!build/**",
          },
        },
      },
    },
  },
}

