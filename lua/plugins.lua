vim.cmd [[packadd packer.nvim]]

return require 'packer'.startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'mbbill/undotree'
    use 'rstacruz/vim-closer'
    use 'tpope/vim-endwise'
    use 'editorconfig/editorconfig-vim'
    use 'nvim-lualine/lualine.nvim'
    use 'lukas-reineke/indent-blankline.nvim'
    use 'preservim/nerdcommenter'
    use 'goolord/alpha-nvim'
    use 'akinsho/toggleterm.nvim'
    use 'kdheepak/lazygit.nvim'
    use 'sindrets/diffview.nvim'
    use "folke/todo-comments.nvim"
    use 'rcarriga/nvim-notify'
    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    -- Completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/vim-vsnip'

    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-nvim-lua'
    use 'hrsh7th/cmp-nvim-lsp-signature-help'
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/cmp-calc'
    -- DAP
    use 'simrat39/rust-tools.nvim'
    use 'mfussenegger/nvim-dap'
    use 'puremourning/vimspector'

    use {
        'phaazon/hop.nvim',
        config = function()
            require 'hop'.setup { keys = 'asdfghjkl;qwertyuiopzxcvbnm,./' }
        end
    }

    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim',
        },
    }

    use {
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    }

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly',
    }

    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
    }
end)
