local vscode = require("config.vscode")

return {
	"seblyng/roslyn.nvim",
	enabled = not vscode.is_disabled("roslyn.nvim"),
	---@module 'roslyn.config'
	---@type RoslynNvimConfig
	opts = {
		-- your configuration comes here; leave empty for default settings
	},
}
