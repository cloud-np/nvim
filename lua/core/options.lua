vim.opt.backup = false -- creates a backup file
vim.opt.clipboard = 'unnamedplus' -- allows neovim to access the system clipboard
vim.opt.cmdheight = 1 -- more space in the neovim command line for displaying messages
vim.opt.completeopt = { 'menuone', 'noselect' } -- mostly just for cmp
vim.opt.conceallevel = 0 -- so that `` is visible in markdown files
vim.opt.fileencoding = 'utf-8' -- the encoding written to a file
vim.opt.hlsearch = true -- highlight all matches on previous search pattern
vim.opt.ignorecase = true -- ignore case in search patterns
vim.opt.mouse = 'a' -- allow the mouse to be used in neovim
vim.opt.pumheight = 10 -- pop up menu height
-- vim.opt.showmode = false -- we don't need to see things like -- INSERT -- anymore
vim.opt.smartcase = true -- smart case
vim.opt.smartindent = true -- make indenting smarter again
vim.opt.splitbelow = true -- force all horizontal splits to go below current window
vim.opt.splitright = true -- force all vertical splits to go to the right of current window
vim.opt.swapfile = false -- creates a swapfile
vim.opt.termguicolors = true -- set term gui colors (most terminals support this)
vim.opt.timeoutlen = 100 -- time to wait for a mapped sequence to complete (in milliseconds)
vim.opt.undofile = true -- enable persistent undo
vim.opt.updatetime = 300 -- faster completion (4000ms default)
vim.opt.writebackup = false -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.cursorline = true -- highlight the current line
vim.opt.number = true -- set numbered lines
vim.opt.relativenumber = true -- set relative numbered lines
vim.opt.numberwidth = 4 -- set number column width to 2 {default 4}
vim.opt.signcolumn = 'yes' -- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false -- display lines as one long line
vim.opt.scrolloff = 8 -- number of screen lines to keep cursor x lines from the edges (top & bottom of screen)
vim.opt.sidescrolloff = 8 -- same as scrolloff but vertical
vim.opt.langmap =
    'ΑAΒB,ΨC,ΔD,ΕE,ΦF,ΓG,ΗH,ΙI,ΞJ,ΚK,ΛL,ΜM,ΝN,ΟO,ΠP,QQ,ΡR,ΣS,ΤT,ΘU,ΩV,WW,ΧX,ΥY,ΖZ,αa,βb,ψc,δd,εe,φf,γg,ηh,ιi,ξj,κk,λl,μm,νn,οo,πp,qq,ρr,σs,τt,θu,ωv,ςw,χx,υy,ζz,'
vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value

-- Tabs
vim.opt.showtabline = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true -- convert tabs to spaces

--[[ vim.opt.foldmethod = 'expr' ]]
--[[ vim.opt.foldexpr = 'nvim_treesitter#foldexpr()' ]]
vim.opt.foldcolumn = '0' -- '0' is not bad
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true
--[[ vim.opt.spell = true ]]
vim.opt.laststatus = 3
-- Removing or shorting some vim messages.
-- vim.opt.shortmess:append('c')
-- TODO: Check this function
-- vim.opt.whichwrap:append('<', '>', '[', ']', 'h', 'l')
vim.opt.iskeyword:append('-')
vim.opt.formatoptions:remove('cro')
-- This is for which key to make it open a bit slower.
vim.opt.timeoutlen = 500
-- [[ Setting globals ]]
-- See `:help vim.o`
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
-- Set highlight on search
vim.o.hlsearch = false
-- Enable mouse mode
vim.o.mouse = 'a'
-- Make line numbers default
vim.wo.number = true
-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true

-- Set tab size to 4 spaces
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true

-- Enable indentLine plugin
vim.g.indentLine_enabled = 1

-- Customize the appearance of the indentLine
vim.g.indentLine_color_term = 239
vim.g.indentLine_color_gui = '#888888'
