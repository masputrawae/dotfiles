local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight saat menyalin (yank)
autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = augroup("highlight_yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
})

-- Sesuaikan ukuran split saat ukuran terminal/window berubah
autocmd("VimResized", {
	desc = "Resize splits when window is resized",
	group = augroup("resize_splits", { clear = true }),
	callback = function()
		local current_tab = vim.fn.tabpagenr()
		vim.cmd("tabdo wincmd =")
		vim.cmd("tabnext " .. current_tab)
	end,
})
