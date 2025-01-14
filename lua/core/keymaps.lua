-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
local keymap = vim.keymap.set
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

keymap('n', '<C-l>', ':bnext<CR>', { noremap = true, silent = true })
keymap('n', '<C-h>', ':bprev<CR>', { noremap = true, silent = true })

-- Diagnostic keymaps
keymap('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = 'Go to next diagnostic message' })
keymap('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = 'Go to previous diagnostic message' })

keymap('n', '<leader>d', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Navigate vim panes better
keymap('n', '<c-k>', ':wincmd k<CR>')
keymap('n', '<c-j>', ':wincmd j<CR>')
keymap('n', '<c-h>', ':wincmd h<CR>')
keymap('n', '<c-l>', ':wincmd l<CR>')

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
keymap('n', '<a-k>', ':resize -3<CR>', { silent = true })
keymap('n', '<a-j>', ':resize +3<CR>', { silent = true })
keymap('n', '<a-h>', ':vertical resize -3<CR>', { silent = true })
keymap('n', '<a-l>', ':vertical resize +3<CR>', { silent = true })
