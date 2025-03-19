require("mason").setup {
    opt = {
        ensure_installed = {
            "lua_ls",
            "angularls",
            -- "astro",
            "cssls",
            "html",
            "rust_analyzer",
            "rustfmt",
            "tailwindcss",
            "tsserver",
        },
        automatic_installation = true, -- not the same as ensure_installed
    },
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}
