-- [[ Configure Telescope ]]
local actions = require('telescope.actions')

-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-w>"] = actions.delete_buffer,
            },
        },
        file_ignore_patterns = {
            'node_modules',
            '*.min.js',
            '*.min.css',
            '*.min.html',
            -- 'vendor',
            -- '*.min.json',
            -- '*.min.py',
            -- '*.min.ts',
            -- '*.min.tsx',
            -- '*.min.jsx',
            -- '*.min.lua',
            -- '*.min.sh',
            -- '*.min.c',
        },

        -- vimgrep_arguments = {
        --     'rg',
        --     '--color=never',
        --     '--no-heading',
        --     '--with-filename',
        --     '--line-number',
        --     '--column',
        --     '--smart-case',
        --     '--hidden',
        --     '--glob=!.git/',
        --     '--glob=!node_modules/',
        --     '--glob=!vendor/',
        --     '--glob=!*.min.js',
        --     '--glob=!*.min.css',
        --     '--glob=!*.min.html',
        --     -- '--glob=!*.min.json',
        --     -- '--glob=!*.min.py',
        --     -- '--glob=!*.min.ts',
        --     -- '--glob=!*.min.tsx',
        --     -- '--glob=!*.min.jsx',
        --     -- '--glob=!*.min.lua',
        --     -- '--glob=!*.min.sh',
        --     -- '--glob=!*.min.c',
        -- },
    },
}

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
local builtin = require('telescope.builtin')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })

-- Git related
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = 'Search [G]it [C]ommits' })
vim.keymap.set('n', '<leader>gbc', builtin.git_bcommits, { desc = 'Search [G]it [B]uffer [C]ommits' })
vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Search [G]it [S]tatus' })


vim.keymap.set('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>st', builtin.treesitter, { desc = '[S]earch [T]reesitter' })
vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
-- require('telescope').setup()

-- vim.keymap.set('n', '<c-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
-- vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
--
