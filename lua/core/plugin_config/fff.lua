local keymap = vim.keymap.set
local fff = require('fff')

local last_fff_search = nil

local function run_fff_search(search)
    last_fff_search = search
    search()
end

local function resume_last_fff_search()
    if last_fff_search then
        last_fff_search()
    else
        run_fff_search(function()
            fff.find_files({ title = 'FFFiles' })
        end)
    end
end

local function recent_files()
    run_fff_search(function()
        -- fff ranks files by frecency, so a blank query acts as the recent/frequent files view.
        fff.find_files({ title = 'Recent Files' })
    end)
end

local function find_buffers()
    local buffers = {}
    for _, buffer in ipairs(vim.api.nvim_list_bufs()) do
        if vim.api.nvim_buf_is_loaded(buffer) and vim.bo[buffer].buflisted then
            local name = vim.api.nvim_buf_get_name(buffer)
            if name ~= '' then
                table.insert(buffers, {
                    bufnr = buffer,
                    label = vim.fn.fnamemodify(name, ':~:.'),
                })
            end
        end
    end

    if #buffers == 0 then
        vim.notify('No listed buffers', vim.log.levels.INFO)
        return
    end

    vim.ui.select(buffers, {
        prompt = 'Buffers',
        format_item = function(item)
            return item.label
        end,
    }, function(item)
        if item then
            vim.api.nvim_set_current_buf(item.bufnr)
        end
    end)
end

local function find_files()
    run_fff_search(function()
        fff.find_files()
    end)
end

local function live_grep(opts)
    run_fff_search(function()
        fff.live_grep(opts)
    end)
end

local function search_word_under_cursor()
    live_grep({ query = vim.fn.expand('<cword>') })
end

local function grep_with_filter(filter)
    live_grep({ query = filter .. ' ' })
end

keymap('n', '<leader>?', recent_files, { desc = '[?] Find recently opened files with fff' })
keymap('n', '<leader><space>', find_buffers, { desc = '[ ] Find existing buffers' })
keymap('n', '<leader>fr', resume_last_fff_search, { desc = 'Resume last fff search' })
keymap('n', '<leader>fs', search_word_under_cursor, { desc = 'Search word under cursor with fff' })

-- Git related
keymap('n', '<leader>gf', find_files, { desc = 'Search [G]it [F]iles with fff' })

keymap('n', '<leader>sf', find_files, { desc = '[S]earch [F]iles with fff' })
keymap('n', '<leader>sw', search_word_under_cursor, { desc = '[S]earch current [W]ord with fff' })
keymap('n', '<leader>/', function()
    live_grep()
end, { desc = '[S]earch by [G]rep with fff' })

-- Dynamic fff grep with query constraints like *.rs, src/main.rs, git:modified, or !test/.
keymap('n', '<leader>sg', function()
    vim.ui.input({ prompt = 'fff grep filter (e.g. *.rs): ' }, function(pattern)
        if pattern and pattern ~= '' then
            grep_with_filter(pattern)
        end
    end)
end, { desc = '[S]earch by [G]rep with fff filter' })

local grep_configs = {
    {
        hotkey = '<leader>sgt',
        query = '*.{ts,tsx}',
        desc = '[S]earch by [G]rep [T]ypescript with fff',
    },
    {
        hotkey = '<leader>sgtn',
        query = '*.{ts,tsx} !*.spec.ts',
        desc = '[S]earch by [G]rep [T]ypescript [N]o Spec with fff',
    },
    {
        hotkey = '<leader>sgh',
        query = '*.html',
        desc = '[S]earch by [G]rep [H]tml with fff',
    },
    {
        hotkey = '<leader>sgs',
        query = '*.spec.ts',
        desc = '[S]earch by [G]rep [S]pec.ts with fff',
    },
    {
        hotkey = '<leader>sge',
        query = '*.effect.ts',
        desc = '[S]earch by [G]rep [E]ffect.ts with fff',
    },
    {
        hotkey = '<leader>sgr',
        query = '*.reducer.ts',
        desc = '[S]earch by [G]rep [R]educer.ts with fff',
    },
    {
        hotkey = '<leader>sga',
        query = '*.action.ts',
        desc = '[S]earch by [G]rep [A]ction.ts with fff',
    },
}

for _, config in ipairs(grep_configs) do
    keymap('n', config.hotkey, function()
        grep_with_filter(config.query)
    end, { desc = config.desc })
end
