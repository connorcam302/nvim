function SetColour(color)
	color = color or "monokai-pro"
	vim.cmd.colorscheme(color)
end
	vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none" })
SetColour()
