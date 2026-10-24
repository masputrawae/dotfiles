return {
	"windwp/nvim-ts-autotag",
	event = "InsertEnter",
	config = function()
		require("nvim-ts-autotag").setup({
			aliases = {
				["gotmpl"] = "html", -- Anggap gotmpl sebagai html untuk penutupan tag
			},
		})
	end,
}
