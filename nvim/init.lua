require("configs")

vim.cmd.colorscheme("catppuccin")
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

vim.filetype.add({
	pattern = {
		[".*%.go%.tmpl"] = "go",
	},
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	pattern = "*.go.tmpl",
	callback = function()
		vim.bo.filetype = "go"
	end,
})
