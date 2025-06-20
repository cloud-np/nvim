local keymap = vim.keymap.set
require("bufferline").setup {
    options = {
        numbers = "none",
        close_command = "bdelete! %d",
        right_mouse_command = "bdelete! %d",
        left_mouse_command = "buffer %d",
        middle_mouse_command = nil,
        indicator = {
            icon = '▎',
            style = 'icon',
        },
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        separator_style = "slant",
    }
}

keymap('n', '<c-l>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
keymap('n', '<c-h>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
