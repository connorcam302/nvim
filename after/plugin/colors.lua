function SetColour(color)
    vim.api.nvim_set_option("background", "dark")
    vim.cmd("colorscheme onehalf-lush-dark")
end

SetColour()
