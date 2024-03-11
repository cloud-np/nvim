-- [[ Configure Telescope ]]
local actions = require('telescope.actions')

-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
<<<<<<< Updated upstream
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
=======
                ['<C-j>'] = require('telescope.actions').move_selection_next,
                ['<C-k>'] = require('telescope.actions').move_selection_previous,
            },
        },
        file_ignore_patterns = { "node_modules", ".git", ".vscode", "testing", "test" }
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case", -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
        }
    }
>>>>>>> Stashed changes
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')
local builtin = require('telescope.builtin')
local helpers = require('helpers')

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
vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

vim.keymap.set('n', '<leader>sgg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
local grep_configs = {
    {
        hotkey = '<leader>sgt',
        searchPattern = { "--type", "ts" },
        desc = '[S]earch by [G]rep [T]ypescript',
        prompt_title = 'Typescripts'
    },
    {
        hotkey = '<leader>sgtn',
        searchPattern = { "--type", "ts", "--glob", "!*.spec.ts" },
        desc = '[S]earch by [G]rep [T]ypescript [N]o Spec',
        prompt_title = 'Typescripts No spec'
    },
    {
        hotkey = '<leader>sgh',
        searchPattern = { "--type", "html" },
        desc = '[S]earch by [G]rep [S]pec.ts',
        prompt_title = 'Htmls'
    },
    {
        hotkey = '<leader>sgs',
        searchPattern = { "--type", "scss" },
        desc = '[S]earch by [G]rep [S]css',
        prompt_title = 'Scss'
    },
    {
        hotkey = '<leader>sge',
        searchPattern = { "--glob", "*.effect.ts" },
        desc = '[S]earch by [G]rep [E]ffect.ts',
        prompt_title = 'Effects'
    },
    {
        hotkey = '<leader>sgr',
        searchPattern = { "--glob", "*.reducer.ts" },
        desc = '[S]earch by [G]rep [R]educer.ts',
        prompt_title = 'Reducers'
    },
    {
        hotkey = '<leader>sgs',
        searchPattern = {'--glob', '*.spec.ts' },
        desc = '[S]earch by [G]rep [S]pec.ts',
        prompt_title = 'Specs'
    },
    {
        hotkey = '<leader>sga',
        searchPattern = {'--glob', '*.action.ts' },
        desc = '[S]earch by [G]rep [A]ction.ts',
        prompt_title = 'Actions'
    },
}

local defaults = { "--glob", "!*svg.ts" }

for _, config in ipairs(grep_configs) do
    vim.keymap.set('n', config.hotkey, function()
        require('telescope.builtin').live_grep({
            additional_args = function()
                return helpers.concatArrays(config.searchPattern, defaults)
            end,
            prompt_title = config.prompt_title
        })
    end, { desc = config.desc })
end
-- require('telescope').setup()

-- vim.keymap.set('n', '<c-p>', builtin.find_files, {})
-- vim.keymap.set('n', '<Space><Space>', builtin.oldfiles, {})
-- vim.keymap.set('n', '<Space>fg', builtin.live_grep, {})
-- vim.keymap.set('n', '<Space>fh', builtin.help_tags, {})
--
