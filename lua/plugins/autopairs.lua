local vscode = require("config.vscode")

return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true,
    enabled = not vscode.is_disabled("nvim-autopairs"),
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
}
