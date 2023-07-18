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
-- Insert this in your on_attach function
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
-- vim.cmd [[ autocmd BufWritePre *.ts,*.js lua vim.lsp.buf.formatting() ]]
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

lspconfig.pyright.setup {
    capabilities = capabilities,
    filetypes = { "python" },
}

lspconfig.tsserver.setup {
  capabilities = capabilities,
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
  -- To verify that an Angular lsp is installed globally or locally.
  -- cmd = {"node", "/path/to/angular-language-service/packages/server/index.js", "--stdio"},
  -- on_new_config = function(new_config, new_root_dir)
  --   new_config.cmd = {
  --     "node",
  --     path.join(new_root_dir, "node_modules", "@angular", "language-service", "bin", "ngserver"),
  --     "--stdio",
  --   }
  -- end,
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
