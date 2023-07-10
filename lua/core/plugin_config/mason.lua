require("mason").setup {
    opt = {
        ensure_installed = {
            "mypy",
            "ruff",
            "pyright",
        }
    },
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
}
