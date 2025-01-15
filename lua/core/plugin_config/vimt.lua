-- Maybe should remove this
local keymap = vim.keymap.set
vim.cmd [[
  let test#javascript#runner = "jest"

  let test#strategy = "floaterm"
]]

-- let test#strategy = "vimux"
-- let test#strategy = "neovim"
keymap('n', '<leader>t', ':TestNearest<CR>')
keymap('n', '<leader>T', ':TestFile<CR>')
-- Create keymaps
keymap('n', '<c-f>', ':FloatermToggle<CR>', { silent = true })
-- Toggle in terminal mode too
keymap('t', '<c-f>', '<C-\\><C-n>:FloatermToggle<CR>', { silent = true })
keymap('t', '<Esc>', '<C-\\><C-n>', { silent = true }) -- Exit terminal mode
keymap('t', '<Esc>', '<C-\\><C-n>', { silent = true }) -- Exit terminal mode
