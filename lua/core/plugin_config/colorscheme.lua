vim.cmd [[ colorscheme catppuccin ]]

local red = '#d20f39'
local yellow = '#df8e1d'
local green = '#40a02b'
local white = '#dce0e8'

vim.cmd('highlight DiffAdd guifg='..white..' guibg='..green)
vim.cmd('highlight DiffChange guifg='..white..' guibg='..yellow)
vim.cmd('highlight DiffDelete guifg='..white..' guibg='..red)
vim.cmd('highlight DiffText guifg='..white..' guibg='..yellow)
