require("configs")

vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

vim.filetype.add({
	extension = {
		gotmpl = "html",
		tmpl = "html",
	},
})
