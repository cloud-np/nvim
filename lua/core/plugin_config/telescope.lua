local keymap = vim.keymap.set
local actions = require('telescope.actions')
local pickers = require('core.plugin_config.pickers')

local oldfiles = function (options)
    pickers.prettyFilesPicker({ picker = 'oldfiles', options = options })
end
local git_files = function (options)
    pickers.prettyFilesPicker({ picker = 'git_files', options = options })
end
local live_grep = function (options)
    pickers.prettyGrepPicker({ picker = 'live_grep', options = options })
end
local grep_string = function (options)
    pickers.prettyGrepPicker({ picker = 'grep_string', options = options })
end
local find_files = function (options)
    pickers.prettyFilesPicker({ picker = 'find_files', options = options })
end
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
    defaults = {
        -- Usefull if pretty pickers have issues
        -- Format path as "file.txt (path\to\file\)"
        path_display = function(_, path)
          local tail = require("telescope.utils").path_tail(path)
          return string.format("%s (%s)", tail, path), { { { 1, #tail }, "Constant" } }
        end,
        matching_strategy = "exact",
        preview_width = 0.4,
        mappings = {
            i = {
                ['<C-u>'] = false,
                ['<C-d>'] = false,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<C-w>'] = actions.delete_buffer,
            },
        },
        file_sorter = require('telescope.sorters').get_fzy_sorter,
        generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
        cache_picker = {
            num_pickers = 10,
            limit_entries = 1000,
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
        file_ignore_patterns = {
            '**/node_modules/*',
            '.git',
            '.vscode',
            'testing',
            'test',
            '*.min.js',
            '*.min.css',
            '*.min.html',
        }
    },
    pickers = {
        find_files = {
            theme = 'dropdown',
        },
        live_grep = {
            layout_config = {
                preview_width = 0.5,
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case', -- or 'ignore_case' or 'respect_case'
            -- the default case_mode is 'smart_case'
        }
    }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
local helpers = require('helpers')

-- See `:help telescope.builtin`
keymap('n', '<leader>?', oldfiles, { desc = '[?] Find recently opened files' })
keymap('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
keymap('n', '<leader>fr', builtin.resume, { desc = 'Resume last telescope search' })
keymap('n', '<leader>fs', function()
    live_grep({
        default_text = vim.fn.expand("<cword>"),
        initial_mode = "normal",
    })
end, { desc = 'Search word under cursor' })

-- Git related
keymap('n', '<leader>gf', git_files, { desc = 'Search [G]it [F]iles' })
keymap('n', '<leader>gc', builtin.git_commits, { desc = 'Search [G]it [C]ommits' })
keymap('n', '<leader>gbc', builtin.git_bcommits, { desc = 'Search [G]it [B]uffer [C]ommits' })
keymap('n', '<leader>gs', builtin.git_status, { desc = 'Search [G]it [S]tatus' })


keymap('n', '<leader>sc', builtin.commands, { desc = '[S]earch [C]ommands' })
keymap('n', '<leader>sk', builtin.keymaps, { desc = '[S]earch [K]eymaps' })
keymap('n', '<leader>sf', find_files, { desc = '[S]earch [F]iles' })
keymap('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp' })
keymap('n', '<leader>st', builtin.treesitter, { desc = '[S]earch [T]reesitter' })
keymap('n', '<leader>sw', grep_string, { desc = '[S]earch current [W]ord' })
keymap('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
keymap('n', '<leader>/', live_grep, { desc = '[S]earch by [G]rep' })
keymap('n', '<leader>s/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[Seacrh][/] Fuzzily search in current buffer' })

local grep_configs = {
    {
        hotkey = '<leader>sgt',
        searchPattern = { '--type', 'ts' },
        desc = '[S]earch by [G]rep [T]ypescript',
        prompt_title = 'Typescripts'
    },
    {
        hotkey = '<leader>sgtn',
        searchPattern = { '--type', 'ts', '--glob', '!*.spec.ts' },
        desc = '[S]earch by [G]rep [T]ypescript [N]o Spec',
        prompt_title = 'Typescripts No spec'
    },
    {
        hotkey = '<leader>sgh',
        searchPattern = { '--type', 'html' },
        desc = '[S]earch by [G]rep [S]pec.ts',
        prompt_title = 'Htmls'
    },
    {
        hotkey = '<leader>sgs',
        searchPattern = { '--type', 'scss' },
        desc = '[S]earch by [G]rep [S]css',
        prompt_title = 'Scss'
    },
    {
        hotkey = '<leader>sge',
        searchPattern = { '--glob', '*.effect.ts' },
        desc = '[S]earch by [G]rep [E]ffect.ts',
        prompt_title = 'Effects'
    },
    {
        hotkey = '<leader>sgr',
        searchPattern = { '--glob', '*.reducer.ts' },
        desc = '[S]earch by [G]rep [R]educer.ts',
        prompt_title = 'Reducers'
    },
    {
        hotkey = '<leader>sgs',
        searchPattern = { '--glob', '*.spec.ts' },
        desc = '[S]earch by [G]rep [S]pec.ts',
        prompt_title = 'Specs'
    },
    {
        hotkey = '<leader>sga',
        searchPattern = { '--glob', '*.action.ts' },
        desc = '[S]earch by [G]rep [A]ction.ts',
        prompt_title = 'Actions'
    },
}

local defaults = { '--glob', '!*svg.ts' }

for _, config in ipairs(grep_configs) do
    keymap('n', config.hotkey, function()
        live_grep({
            additional_args = function()
                return helpers.concatArrays(config.searchPattern, defaults)
            end,
            prompt_title = config.prompt_title,
        })
    end, { desc = config.desc })
end
-- require('telescope').setup()

-- keymap('n', '<c-p>', builtin.find_files, {})
-- keymap('n', '<Space><Space>', builtin.oldfiles, {})
-- keymap('n', '<Space>fg', builtin.live_grep, {})
-- keymap('n', '<Space>fh', builtin.help_tags, {})
-- --
