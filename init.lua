if vim.g.vscode then
    -- There are not working why?
    require("vscode.settings")
    -- vim.api.nvim_set_keymap('n', '<Space>', ":call VSCodeNotify('whichkey.show')<CR>", {})
    -- vim.api.nvim_set_keymap('x', '<Space>', ":call VSCodeNotify('whichkey.show')<CR>", {})
else
    require("core.options")
    require("core.keymaps")
    require("core.plugins")
    require("core.autocommands")
    require("core.plugin_config")
end
