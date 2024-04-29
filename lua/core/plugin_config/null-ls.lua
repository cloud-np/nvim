local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.bultins.diagnostics.mypy,
        null_ls.bultins.diagnostics.ruff,
        null_ls.bultins.formatting.prettier.with({
            filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx", "html", "css" },
            args = { "--tabs-width", "4", "--use-tabs", "true", "--no-semi", "false", "--single-quote", "true", "--trailing-comma", "all", "--bracket-spacing", "true", "--arrow-parens", "always", "--print-width", "120" },
        }),
    }
})

