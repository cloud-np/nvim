-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
local keymap = vim.keymap.set
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
keymap('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = 'Go to next diagnostic message' })
keymap('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = 'Go to previous diagnostic message' })

keymap('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Navigate vim panes better
keymap('n', '<a-k>', ':wincmd k<CR>')
keymap('n', '<a-j>', ':wincmd j<CR>')
keymap('n', '<a-h>', ':wincmd h<CR>')
keymap('n', '<a-l>', ':wincmd l<CR>')

-- TODO: Assign these
-- keymap('n', '', ':bnext<CR>', { noremap = true, silent = true })
-- keymap('n', '', ':bprev<CR>', { noremap = true, silent = true })

-- Close current buffer
keymap('n', '<leader>bd', ':bd<CR>', { desc = "Close Buffer", silent = true, noremap = true })

keymap('n', '<leader>h', ':nohlsearch<CR>')

-- To navigate the completion menu
keymap('i', '<c-j>', 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { noremap = true, expr = true, silent = true })
keymap('i', '<c-k>', 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { noremap = true, expr = true, silent = true })

-- Function to toggle buffer maximize/minimize
keymap('n', '<leader>bt', function()
    if vim.g.maximized_buffer then
        -- Restore to equal sizes
        vim.cmd('winc =')
        vim.g.maximized_buffer = false
    else
        -- Get the total available height (minus cmdheight and other UI elements)
        local available_height = vim.o.lines - vim.o.cmdheight
        if vim.o.laststatus > 0 then
            available_height = available_height - 1 -- Subtract 1 for status line
        end

        vim.cmd('resize ' .. available_height)
        vim.cmd('vertical resize ' .. vim.o.columns)
        vim.g.maximized_buffer = true
    end
end, { desc = "[T]oggle buffer size", silent = true })

-- Buffer resizing
keymap('n', '<c-Up>', ':resize -3<CR>', { silent = true })
keymap('n', '<c-Down>', ':resize +3<CR>', { silent = true })
keymap('n', '<c-Left>', ':vertical resize -3<CR>', { silent = true })
keymap('n', '<c-Right>', ':vertical resize +3<CR>', { silent = true })

-- Copy to clipboard
keymap('v', '<leader>y', '"+y', { desc = 'Copy selection to clipboard' })
keymap('n', '<leader>Y', '"+yg_', { desc = 'Copy from cursor to end of line to clipboard' })
keymap('n', '<leader>y', '"+y', { desc = 'Copy to clipboard (normal mode)' })
keymap('n', '<leader>yy', '"+yy', { desc = 'Copy line to clipboard' })

-- Paste from clipboard
keymap('n', '<leader>p', '"+p', { desc = 'Paste from clipboard after cursor' })
keymap('n', '<leader>P', '"+P', { desc = 'Paste from clipboard before cursor' })
keymap('v', '<leader>p', '"+p', { desc = 'Paste from clipboard after selection' })
keymap('v', '<leader>P', '"+P', { desc = 'Paste from clipboard before selection' })
