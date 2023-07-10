local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    'wbthomason/packer.nvim',
    'ellisonleao/gruvbox.nvim',
    {
        'catppuccin/nvim',
        name = "catppuccin",
        lazy = false
    },

    {
        'glepnir/lspsaga.nvim',
        event = 'LspAttach',
        config = function()
            require('lspsaga').setup({})
        end
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    'nvim-tree/nvim-tree.lua',
    'nvim-tree/nvim-web-devicons',
    'nvim-lualine/lualine.nvim',
    'nvim-treesitter/nvim-treesitter',
    -- Unfortunatly, this is not working
    -- 'nvim-treesitter/nvim-treesitter-angular',
    'princejoogie/tailwind-highlight.nvim',
    'vim-test/vim-test',
    'lewis6991/gitsigns.nvim',
    'preservim/vimux',
    'christoomey/vim-tmux-navigator',
    'tpope/vim-fugitive',
    'tpope/vim-commentary',

    'Yggdroot/indentLine',

    -- rust babyyyyyyy
    'mfussenegger/nvim-dap',
    'rcarriga/nvim-dap-ui',
    'simrat39/rust-tools.nvim',

    -- various tooling for langs
    {
        'jose-elias-alvarez/null-ls.nvim',
        ft = {'javascript', 'typescript', 'typescriptreact', 'javascriptreact', 'lua', 'python', 'rust'},
    },
    -- completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip',
    "rafamadriz/friendly-snippets",
    "github/copilot.vim",
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "williamboman/mason-lspconfig.nvim",
    "glepnir/lspsaga.nvim",
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.0',
      dependencies = { {'nvim-lua/plenary.nvim'} }
    }
}

local opts = {}

require("lazy").setup(plugins, opts)
