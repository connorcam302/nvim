return {
 {
   'neovim/nvim-lspconfig',
   dependencies = {
     { 'williamboman/mason.nvim', opts = { PATH = "append" } },
     'williamboman/mason-lspconfig.nvim',
     'WhoIsSethDaniel/mason-tool-installer.nvim',
     { 'j-hui/fidget.nvim', opts = {} },
     'saghen/blink.cmp',
     'ibhagwan/fzf-lua', -- make sure fzf-lua is installed
   },
   config = function()
     local capabilities = require('blink.cmp').get_lsp_capabilities()
     -- Setup Mason
     require("mason").setup({ PATH = "append" })
     require("mason-lspconfig").setup({
       ensure_installed = { "ts_ls" },
       automatic_installation = true,
       handlers = {
       function(server)
         require("lspconfig")[server].setup({
           capabilities = capabilities,
         })
       end,
       }
     })

     vim.api.nvim_create_autocmd('LspAttach', {
       callback = function(args)
         vim.keymap.set("n", "gd", function()
           require('fzf-lua').lsp_definitions()
         end, { desc = 'Goto Definition' })
         vim.keymap.set("n", "gr", function()
           require('fzf-lua').lsp_references()
         end, { desc = 'Goto References' })
         vim.keymap.set("n", "<leader>sp", function()
           require('fzf-lua').spell_suggest()
         end, { desc = 'Spell check' })
       end,
     })
     
     -- Optional diagnostics icons
     if vim.g.have_nerd_font then
       local signs = { ERROR = '', WARN = '', INFO = '', HINT = '' }
       local diagnostic_signs = {}
       for type, icon in pairs(signs) do
         diagnostic_signs[vim.diagnostic.severity[type]] = icon
       end
       vim.diagnostic.config { signs = { text = diagnostic_signs } }
     end
   end,
 },
}
