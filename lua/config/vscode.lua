local M = {}

M.plugins_to_disable = {}

M.disable_plugin = function(plugin_name)
	M.plugins_to_disable[plugin_name] = true
end

M.is_disabled = function(plugin_name)
	return M.plugins_to_disable[plugin_name] == true
end

if vim.g.vscode then
	M.disable_plugin("fzf-lua")
	M.disable_plugin("lualine.nvim")
	M.disable_plugin("kanagawa.nvim")
	M.disable_plugin("harpoon")
	M.disable_plugin("nvim-treesitter")
	M.disable_plugin("nvim-lspconfig")
end

return M
