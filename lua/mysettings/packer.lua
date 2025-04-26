-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.8',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    use({ 
        'rose-pine/neovim', 
        as = 'rose-pine' ,
        config = function() 
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    -- You'll also need plenary.nvim
    use { 'nvim-lua/plenary.nvim' }
    -- Git Plugin
    use {
        "lewis6991/gitsigns.nvim",
    }

    -- sourcegraph
    use { 'sourcegraph/sg.nvim', run = 'nvim -l build/init.lua' }

    -- WhichKey (displays all the keybindings)
    use {
        "folke/which-key.nvim",
        config = function()
            require("config.whichkey").setup()
        end,
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = {
            'nvim-tree/nvim-web-devicons', -- optional
        },
    }
end)
