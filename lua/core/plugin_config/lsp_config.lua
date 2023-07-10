require("mason-lspconfig").setup()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lspsaga = require('lspsaga')
local lspconfig = require('lspconfig')

lspsaga.setup({
  code_action_icon = "💡",
  symbol_in_winbar = {
    in_custom = false,
    enable = true,
    separator = ' ',
    show_file = true,
    file_formatter = ""
  },
})

vim.keymap.set("n", "gd", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })
vim.keymap.set('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
vim.keymap.set({"n","v"}, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
vim.keymap.set("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

lspconfig.lua_ls.setup {
  capabilities = capabilities,
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  }
}

lspconfig.solargraph.setup {
    capabilities = capabilities,
}

lspconfig.pyright.setup {
    capabilities = capabilities,
    filetypes = { "python" },
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
}

lspconfig.tsserver.setup {
  cmd = {"typescript-language-server", "--stdio"},
  filetypes = {"javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx"},
  root_dir = function(fname)
    return lspconfig.util.root_pattern('package.json', 'tsconfig.json', '.git')(fname) or lspconfig.util.path.dirname(fname)
  end,
  on_attach = function(client, bufnr)
    -- Optional: your additional configurations...
  end
}

lspconfig.angularls.setup {
  capabilities = capabilities,
}

lspconfig.rust_analyzer.setup {
    capabilities = capabilities,
    -- on_attach = on_attach,
    cmd = {
        "rustup", "run", "stable", "rust-analyzer"
    }
    -- settings = {
    --     ["rust-analyzer"] = {
    --         assist = {
    --             importGranularity = "module",
    --             importPrefix = "by_self",
    --         },
    --         cargo = {
    --             loadOutDirsFromCheck = true
    --         },
    --         procMacro = {
    --             enable = true
    --         },
    --     }
    -- }
}
