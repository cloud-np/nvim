local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
-- TODO: Check why this says Undefined field for fs_stat
-- https://neovim.io/doc/user/luvref.html#uv.fs_stat()
if not vim.uv.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = true
    },

    {
        'glepnir/lspsaga.nvim',
        event = 'LspAttach',
        config = function()
            require('lspsaga').setup({})
        end
    },
    {
        'folke/which-key.nvim',
        event = 'VeryLazy',
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
    -- For indent annoying lines
    -- Migrating to from 2 to 3
    { 'lukas-reineke/indent-blankline.nvim', main = 'ibl',  opts = {} }, -- Better UI indentantion in files
    -- 'Yggdroot/indentLine',
    'nvim-tree/nvim-tree.lua',

    { 'echasnovski/mini.nvim', version = '*' }, -- mini icons
    'nvim-tree/nvim-web-devicons', -- Helps with nerdfonts in neovim?
    'nvim-lualine/lualine.nvim', -- Status line at the bottom
    'nvim-treesitter/nvim-treesitter',
    'tpope/vim-repeat', -- Depedency for leap.nvim
    -- 'ggandor/leap.nvim',
    'princejoogie/tailwind-highlight.nvim',
    'vim-test/vim-test', -- Running tests
    'lewis6991/gitsigns.nvim', -- Git blame, diffs etc quite useful
    -- 'preservim/vimux', -- Run tmux commands from vim, learn tmux first
    -- 'christoomey/vim-tmux-navigator', -- Navigate tmux panes with vim, learn tmux first

    -- 'tpope/vim-fugitive', -- Git commands in nvim
    'tpope/vim-commentary', -- Comment stuff with gc and gcc

    -- {
    --     'leoluz/nvim-dap-go',
    --     ft = {'go'},
    --     depedencies = 'mfussenegger/nvim-dap',
    --     config = function(_, opts)
    --         require('dap-go').setup(opts)
    --     end
    -- },
    -- 'mfussenegger/nvim-dap', -- Once you learn the rest then use it
    -- 'rcarriga/nvim-dap-ui',
    -- 'simrat39/rust-tools.nvim', -- Once you learn Rust then use it

    -- various tooling for langs
    -- No longer maintained swap soon.
    -- { 'jose-elias-alvarez/null-ls.nvim',
    --     ft = { 'javascript', 'typescript',
    --         -- 'typescriptreact',
    --         -- 'javascriptreact',
    --         -- 'rust',
    --         'lua', 'python',
    --     },
    -- },

    -- completion
    'hrsh7th/nvim-cmp',
    'hrsh7th/cmp-nvim-lsp',
    --

    -- Snippets
    'L3MON4D3/LuaSnip',
    'saadparwaiz1/cmp_luasnip', -- allows the above LuaSnip snippets in the completion of nvim-cmp
    -- 'rafamadriz/friendly-snippets', -- To be used with LuaSnip needs some extra config
    -- https://github.com/rafamadriz/friendly-snippets
    --

    'github/copilot.vim',
    'williamboman/mason.nvim',
    'neovim/nvim-lspconfig',
    'williamboman/mason-lspconfig.nvim',
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },
    -- { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release ; cmake --build build --config Release ; cmake --install build --prefix build' }
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
}

local opts = {}

require('lazy').setup(plugins, opts)
