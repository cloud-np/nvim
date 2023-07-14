require('gitsigns').setup{
    signs = {
        add          = { text = '│' },
        change       = { text = '│' },
        delete       = { text = '_' },
        topdelete    = { text = '‾' },
        changedelete = { text = '~' },
        untracked    = { text = '┆' },
    },
    signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
    numhl      = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
        follow_files = true
    },
    attach_to_untracked = true,
    current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 0,
        ignore_whitespace = false,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
        -- Options passed to nvim_open_win
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1
    },
    yadm = { enable = false },
    on_attach = function(bufnr)
        local gs = package.loaded.gitsigns

        local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
        end


        -- Navigation
        map('n', '<leader>ghn', gs.next_hunk, { desc="Navigate to next hunk" })
        map('n', '<leader>ghp', gs.prev_hunk, { desc="Navigate to prev hunk" })
        -- Actions
        map('n', '<leader>ghs', gs.stage_hunk, { desc="Stage current hunk" })
        map('n', '<leader>ghr', gs.reset_hunk, { desc="Reset current hunk" })
        map('v', '<leader>ghs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('v', '<leader>ghr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
        map('n', '<leader>gS', gs.stage_buffer, { desc="Stage all changes in buffer" })
        map('n', '<leader>gu', gs.undo_stage_hunk, { desc="Undo last hunk stage" })
        -- map('n', '<leader>gR', gs.reset_buffer, { desc="Reset all changes in buffer" })
        map('n', '<leader>gp', gs.preview_hunk, { desc="Preview changes in hunk" })
        map('n', '<leader>gb', function() gs.blame_line{ full=true } end, { desc="Show blame for current line" })
        map('n', '<leader>gtb', gs.toggle_current_line_blame, { desc="Toggle blame for current line" })
        map('n', '<leader>gd', gs.diffthis, { desc="Show diff for current file" })
        map('n', '<leader>gD', function() gs.diffthis('~') end, { desc="Show diff for current file against the base" })
        map('n', '<leader>gtd', gs.toggle_deleted, { desc="Toggle display of deleted lines" })

        -- Text object
        map('v', 'ih', ':<C-U>Gitsigns select_hunk<CR>', { desc="Select current hunk" })
    end
}
