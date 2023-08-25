function SetColour(color)
	color = color or "monokai-pro"
	vim.cmd.colorscheme(color)
end

SetColour()
