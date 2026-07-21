-- lua/core/autocmds.lua
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- Grup untuk autocmd umum
local general = augroup("General", { clear = true })

-- Highlight saat yank
autocmd("TextYankPost", {
  group = general,
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Kembali ke posisi terakhir saat membuka file
autocmd("BufReadPost", {
  group = general,
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      vim.cmd('normal! g`"')
    end
  end,
})

autocmd("BufEnter", {
  group = general,
  pattern = "*.templ",
  callback = function()
    vim.treesitter.start()
  end,
})

autocmd({ "BufWritePre" }, {
  group = general,
  pattern = { "*.templ" },
  callback = vim.lsp.buf.format
})
