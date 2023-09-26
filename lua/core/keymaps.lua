-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-l>', ':bnext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<C-h>', ':bprev<CR>', {noremap = true, silent = true})

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Close current buffer
vim.api.nvim_set_keymap('n', '<C-w>', ':bd<CR>', { silent = true, noremap = true })

vim.keymap.set('n', '<leader>h', ':nohlsearch<CR>')

-- To navigate the completion menu
vim.api.nvim_set_keymap('i', '<C-j>', 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { noremap = true, expr = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-k>', 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { noremap = true, expr = true, silent = true })

-- To resize buffers
-- NOTE: This needs to
-- Define the key mappings with descriptions
vim.api.nvim_set_keymap('n', '<Leader>bh+', ':resize +5<CR>', { desc = "Increase Height", noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bh-', ':resize -5<CR>', { desc = "Decrease Height", noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bw+', ':vertical resize +5<CR>', { desc = "Increase Width", noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>bw-', ':vertical resize -5<CR>', { desc = "Decrease Width", noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<C-S-j>', ':resize +10<CR>', {})
vim.api.nvim_set_keymap('n', '<C-S-k>', ':resize -10<CR>', {})
vim.api.nvim_set_keymap('n', '<C-S-h>', ':vertical resize -10<CR>', {})
vim.api.nvim_set_keymap('n', '<C-S-l>', ':vertical resize +10<CR>', {})
