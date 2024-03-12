require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'seoul256',
    },
    sections = {
        lualine_a = {
            {
                'filename',
                path = 1,
            }
        }
    }
}
