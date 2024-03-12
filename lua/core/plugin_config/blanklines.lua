vim.opt.list = true
-- vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

-- require("indent_blankline").setup {
--     space_char_blankline = " ",
--     show_current_context = true,
--     show_current_context_start = true,
--     show_end_of_line = true,
--     -- buftype_exclude = {"terminal"},
--     -- show_first_indent_level = false,
-- }

require("ibl").setup {
    indent = { },
    exclude = { },
    scope = {
        enabled = true,
        show_start = true,
        show_end = true,
    },
}

-- vim.opt.listchars:remove("tab:>") -- Assuming "tab:>-"
