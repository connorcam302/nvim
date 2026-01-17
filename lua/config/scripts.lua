vim.api.nvim_create_autocmd("TextYankPost", {
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
	callback = function()
		vim.diagnostic.open_float(nil, { focus = false, border = "rounded" })
	end,
})

vim.api.nvim_create_user_command("UnityRegen", function()
	local regen_file = "Assets/.unity_regen.cs"
	vim.fn.system({ "touch", regen_file })

	vim.cmd("LspRestart")

	vim.notify("Unity: forced .slnx regeneration + Roslyn restarted", vim.log.levels.INFO)
end, {})
