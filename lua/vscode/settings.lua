-- Define a local module for VSCode integration
-- local vscode = {}

-- Split editor function
local function split(direction, file)
    file = file or ''
    if direction == 'h' then
        vim.call('VSCodeCall', 'workbench.action.splitEditorDown')
    else
        vim.call('VSCodeCall', 'workbench.action.splitEditorRight')
    end
    if file ~= '' then
        vim.call('VSCodeExtensionNotify', 'open-file', vim.fn.expand(file), 'all')
    end
end

-- Split editor with a new file
local function splitNew(direction, file)
    file = file or '__vscode_new__'
    split(direction, file)
end

-- Close other editors
local function closeOtherEditors()
    vim.call('VSCodeNotify', 'workbench.action.closeEditorsInOtherGroups')
    vim.call('VSCodeNotify', 'workbench.action.closeOtherEditors')
end

-- Manage editor size
local function manageEditorSize(count, to)
    count = count or 1
    local action = to == 'increase' and 'workbench.action.increaseViewSize' or 'workbench.action.decreaseViewSize'
    for _ = 1, count do
        vim.call('VSCodeNotify', action)
    end
end

-- Commands
vim.api.nvim_create_user_command('Split', function(input) split('h', input.args) end, {nargs = '?', complete = 'file'})
vim.api.nvim_create_user_command('Vsplit', function(input) split('v', input.args) end, {nargs = '?', complete = 'file'})
vim.api.nvim_create_user_command('New', function() splitNew('h', '__vscode_new__') end, {nargs = 0})
vim.api.nvim_create_user_command('Vnew', function() splitNew('v', '__vscode_new__') end, {nargs = 0})
vim.api.nvim_create_user_command('Only', function(input)
    if input.bang then
        closeOtherEditors()
    else
        vim.call('VSCodeNotify', 'workbench.action.joinAllGroups')
    end
end, {bang = true})

-- Key mappings
local map_opts = {noremap = true, silent = true}
vim.keymap.set('n', '<C-w>s', function() split('h') end, map_opts)
vim.keymap.set('x', '<C-w>s', function() split('h') end, map_opts)
vim.keymap.set('n', '<C-w>v', function() split('v') end, map_opts)
vim.keymap.set('x', '<C-w>v', function() split('v') end, map_opts)
vim.keymap.set('n', '<C-w>n', function() splitNew('h', '__vscode_new__') end, map_opts)
vim.keymap.set('x', '<C-w>n', function() splitNew('h', '__vscode_new__') end, map_opts)
-- Add more mappings following the same pattern for other functionalities

-- return vscode
