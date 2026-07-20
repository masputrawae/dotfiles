-- lua/plugins/productivity/gitsigns.lua
return {
  {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "BufReadPre",
    config = function()
      local gitsigns = require("gitsigns")
      gitsigns.setup({
        signs = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
          untracked = { text = "▎" },
        },
        signs_staged = {
          add = { text = "▎" },
          change = { text = "▎" },
          delete = { text = "" },
          topdelete = { text = "" },
          changedelete = { text = "▎" },
        },
        on_attach = function(bufnr)
          local map = function(mode, lhs, rhs, opts)
            opts = vim.tbl_extend("force", { buffer = bufnr }, opts or {})
            vim.keymap.set(mode, lhs, rhs, opts)
          end

          map("n", "]h", gitsigns.next_hunk, { desc = "Next git hunk" })
          map("n", "[h", gitsigns.prev_hunk, { desc = "Prev git hunk" })
          map("n", "<leader>gs", gitsigns.stage_hunk, { desc = "Stage hunk" })
          map("n", "<leader>gr", gitsigns.reset_hunk, { desc = "Reset hunk" })
          map("v", "<leader>gs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Stage visual hunk" })
          map("v", "<leader>gr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end, { desc = "Reset visual hunk" })
          map("n", "<leader>gS", gitsigns.stage_buffer, { desc = "Stage all" })
          map("n", "<leader>gR", gitsigns.reset_buffer, { desc = "Reset all" })
          map("n", "<leader>gp", gitsigns.preview_hunk, { desc = "Preview hunk" })
          map("n", "<leader>gb", function() gitsigns.blame_line({ full = true }) end, { desc = "Blame line" })
          map("n", "<leader>gd", gitsigns.diffthis, { desc = "Diff this" })
          map("n", "<leader>gD", function() gitsigns.diffthis("~") end, { desc = "Diff with previous" })
          map("n", "<leader>gt", gitsigns.toggle_current_line_blame, { desc = "Toggle blame" })
        end,
      })
    end,
  },
}
