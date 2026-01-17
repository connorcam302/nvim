if vim.g.neovide then
	vim.g.neovide_scroll_animation_length = 0.2
	vim.g.neovide_input_use_logo = true -- enables Cmd key
	vim.g.neovide_cursor_animation_length = 0.00
	vim.g.neovide_cursor_trail_size = 0
	vim.g.neovide_cursor_animate_in_insert_mode = false
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.guifont = "GeistMono Nerd Font"

	local function set_cwd_to_project_root()
		local file = vim.api.nvim_buf_get_name(0)
		if file == "" then
			return
		end

		local dir = vim.fn.fnamemodify(file, ":p:h")

		-- Look for common Unity project markers
		local root = vim.fs.find({ ".git", "Assets", "ProjectSettings", "Packages" }, { path = dir, upward = true })[1]

		if root then
			-- Set Neovim's working directory to the project root
			vim.cmd("cd " .. vim.fn.fnamemodify(root, ":h"))
		end
	end

	-- Run when entering a buffer
	vim.api.nvim_create_autocmd("BufEnter", {
		callback = set_cwd_to_project_root,
	})
end
