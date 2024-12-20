-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        -- or                            , branch = '0.1.x',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

    use { "catppuccin/nvim", as = "catppuccin" }
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    use { 'prettier/vim-prettier', run = 'npm install' }

    use("nvim-treesitter/playground")
    use("theprimeagen/harpoon")
    use("mbbill/undotree")
    use("tpope/vim-fugitive")
    use('ThePrimeagen/vim-be-good')
    use('github/copilot.vim')
    use { 'mrshmllow/document-color.nvim', config = function()
  require("document-color").setup {
    -- Default options
    mode = "background", -- "background" | "foreground" | "single"
  }
  end
}
    use({
  "roobert/tailwindcss-colorizer-cmp.nvim",
  -- optionally, override the default options:
  config = function()
    require("tailwindcss-colorizer-cmp").setup({
      color_square_width = 2,
    })
  end
})

    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v1.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },
        }
    }

    vim.cmd([[ let g:neo_tree_remove_legacy_commands = 1 ]])

    use {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v2.x",
        requires = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
        }
    }

    use { 'L3MON4D3/LuaSnip' }
    use {
        'hrsh7th/nvim-cmp',
        config = function ()
        require'cmp'.setup {
            snippet = {
                expand = function(args)
                require'luasnip'.lsp_expand(args.body)
            end
            },

        sources = {
        { name = 'luasnip' },
      -- more sources
    },
  }
  end
}

    use { 'saadparwaiz1/cmp_luasnip' }

    use {
        'andymass/vim-matchup',
        setup = function()
            -- may set any options here
            vim.g.matchup_matchparen_offscreen = { method = "popup" }
        end
    }

    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use {
        "windwp/nvim-autopairs",
        config = function() require("nvim-autopairs").setup {} end
    }

    use('neovim/nvim-lspconfig')
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')
end)
