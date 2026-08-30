-- Netrw configuration
vim.g.netrw_liststyle = 3    -- tree view
vim.g.netrw_banner = 0       -- hide the top banner
vim.g.netrw_winsize = 20     -- fix the left split width
vim.g.netrw_browse_split = 0 -- open files in the previous window
vim.g.netrw_altfile = 1      -- keep the alternate file correct

-- Keymap
vim.keymap.set("n", "<leader>e", ":Lexplore<cr>", { silent = true })

-- Override netrw's `%` to open files in the previous window instead of netrw window
vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    vim.keymap.set("n", "%", function()
      local fname = vim.fn.input("Enter filename: ")
      if fname == "" then
        return
      end

      local dir = vim.b.netrw_curdir or vim.fn.getcwd()
      local path = dir .. "/" .. fname

      -- Check if file/directory already exists
      if vim.fn.filereadable(path) == 1 or vim.fn.isdirectory(path) == 1 then
        vim.notify("Already exists: " .. fname, vim.log.levels.WARN)
        return
      end

      -- Create directory
      if fname:match("/$") then
        vim.fn.mkdir(path, "p")
        vim.cmd("edit")
        return
      end

      -- Create file
      local f = io.open(path, "w")
      if not f then
        vim.notify("Failed to create: " .. fname, vim.log.levels.ERROR)
        return
      end
      f:close()

      -- Open in previous window
      local escaped = vim.fn.fnameescape(path)
      if vim.fn.winnr("#") == 0 then
        vim.cmd("edit " .. escaped)
      else
        vim.cmd("wincmd p")
        vim.cmd("edit " .. escaped)
      end
    end, { buffer = true, silent = true, noremap = true, desc = "Create file in previous window" })
  end,
})
