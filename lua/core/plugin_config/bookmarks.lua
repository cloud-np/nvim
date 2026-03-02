-- Disable default keymaps so we set our own
vim.g.bookmark_no_default_key_mappings = 1

require('telescope').load_extension('vim_bookmarks')

local keymap = vim.keymap.set

-- noremap must be false for <Plug> mappings
keymap('n', '<leader>bt', '<Plug>BookmarkToggle', { noremap = false, silent = true, desc = '[B]ookmark [T]oggle' })
keymap('n', ']b',         '<Plug>BookmarkNext',   { noremap = false, silent = true, desc = 'Next bookmark' })
keymap('n', '[b',         '<Plug>BookmarkPrev',   { noremap = false, silent = true, desc = 'Previous bookmark' })
