local vscode = require("config.vscode")

return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {},
	enabled = not vscode.is_disabled("fzf-lua"),
	keys = {
		{ "<leader>pf", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Find files" },
		{ "<leader>ps", "<cmd>lua require('fzf-lua').live_grep()<CR>", desc = "Find line" },
		{ "<C-l>", "<cmd>lua require('fzf-lua').quickfix()<CR>" },
		desc = "Send to quickfix",
	},
	config = function()
		local fzf = require("fzf-lua")
		vim.ui.select = function(items, opts, on_choice)
			opts = opts or {}
			fzf.fzf_exec(items, {
				prompt = opts.prompt or "Select> ",
				winopts = { height = 0.4, width = 0.5 },
				actions = {
					["default"] = function(selected)
						on_choice(selected[1])
					end,
				},
			})
		end

		vim.ui.input = function(opts, on_confirm)
			fzf.fzf_exec({ "" }, {
				prompt = opts.prompt or "Input> ",
				actions = {
					["default"] = function(selected)
						on_confirm(selected[1])
					end,
				},
			})
		end
	end,
}
