local vscode = require("config.vscode")

return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
		padding = true,
		sticky = true,
		toggler = {
			---Line-comment toggle keymap
			line = "gcc",
			---Block-comment toggle keymap
			block = "gbc",
		},
	},
	enabled = not vscode.is_disabled("Comment.nvim"),
}
