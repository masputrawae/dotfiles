local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("PackChanged", {
	desc = "Build blink.cmp after install/update",
	group = augroup("blink_build", { clear = true }),
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "blink.cmp" and (kind == "install" or kind == "update") then
			vim.notify("Building blink.cmp...", vim.log.levels.INFO)
			vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.path }):wait()
			local cmp = require("blink.cmp")
			cmp.build():pwait()
		end
	end,
})

