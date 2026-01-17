local vscode = require("config.vscode")

return {
	"nvim-lualine/lualine.nvim",
    dependencies = { 'nvim-tree/nvim-web-devicons' },
	enabled = not vscode.is_disabled("lualine.nvim"),
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = false,
				theme = "auto",
				component_separators = "",
				section_separators = "",
			},
			sections = {
				lualine_a = { "" },
				lualine_b = { { "filename", path = 1 } },
				lualine_c = { "diff", "diagnostics" },
				lualine_x = { "filetype" },
				lualine_y = { "progress" },
				lualine_z = { "location" },
			},
		})
	end,
}
