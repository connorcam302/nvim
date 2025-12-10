local set = vim.keymap.set
vim.g.mapleader = " "

-- Exit to file tree
set("n", "<leader>pv", vim.cmd.Ex)

-- Clear highlight on search
set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Re-source current file
set("n", "<leader><leader>", function()
vim.cmd("so")
  vim.notify("Config reloaded.", vim.log.levels.INFO)
end, { desc = "Reload Neovim config" })

-- Indent lines
set("x", ">", ">gv", { noremap = true, silent = true })
set("x", "<", "<gv", { noremap = true, silent = true })

-- Move lines up and down
set("v", "J", ":m '>+1<CR>gv=gv")
set("v", "K", ":m '<-2<CR>gv=gv")

-- Disable Ex mode
set("n", "Q", "<nop>")

-- Exit insert mode override
set("i", "<C-c>", "<Esc>")

-- Toggle linewrap
set("n", "<leader>w", function()
	if vim.wo.wrap then
		vim.wo.wrap = false
		print("Wrap: OFF")
	else
		vim.wo.wrap = true
		print("Wrap: ON")
	end
end, { desc = "Toggle line wrap" })

-- Keeps cursor in center on page up/down
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")

-- Keeps cursor in center on search navigate
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
