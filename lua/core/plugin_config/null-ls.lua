local null_ls = require('null-ls')

null_ls.setup({
    sources = {
        null_ls.bultins.diagnostics.mypy,
        null_ls.bultins.diagnostics.ruff,
    }
})

