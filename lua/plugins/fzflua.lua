return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {},
  keys = {
    { "<leader>pf", "<cmd>lua require('fzf-lua').files()<CR>", desc = "Find files" },
    { "<leader>ps", "<cmd>lua require('fzf-lua').live_grep()<CR>", desc = "Find line" },
  }
}


