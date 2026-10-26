return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- 1. Setup parser yang otomatis terinstall
		require("nvim-treesitter.install").update({ with_sync = true })

		-- 2. Daftar bahasa yang wajib di-install
		local ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"query",
			"javascript",
			"typescript",
			"html",
			"css",
			"json",
			"markdown",
			"markdown_inline",
			"bash",
			"python",
			"rust",
			"sql",
			"go",
			"gotmpl",
			"make",
		}

		-- Install otomatis jika belum ada
		for _, lang in ipairs(ensure_installed) do
			pcall(vim.cmd, "TSInstall " .. lang)
		end

		-- 3. Aktifkan fitur highlighting bawaan Neovim (v0.10+) via Treesitter
		vim.api.nvim_create_autocmd("FileType", {
			pattern = ensure_installed,
			callback = function(ev)
				pcall(vim.treesitter.start, ev.buf)
			end,
		})
	end,
}
