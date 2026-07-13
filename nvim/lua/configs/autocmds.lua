-- ~/.config/nvim/lua/config/autocmds.lua

-- Background transparan (Opsional: hapus jika ingin pakai background colorscheme)
local rm_bg = function()
  vim.api.nvim_set_hl(0, "Normal", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "NormalNC", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "SignColumn", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLine", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "StatusLineNC", { bg = "NONE", ctermbg = "NONE" })
  vim.api.nvim_set_hl(0, "VertSplit", { bg = "NONE", ctermbg = "NONE" })
end

-- Panggil saat awal dan saat ganti colorscheme
vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = rm_bg,
})

-- Jalankan sekali saat startup
rm_bg()

vim.filetype.add({ extension = { templ = "templ" } })

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'templ',
  callback = function()
    vim.treesitter.start()
  end,
})
