require("mason-lspconfig").setup()
local keymap = vim.keymap.set

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

keymap('n', 'K', '<Cmd>Lspsaga hover_doc<cr>', { silent = true })
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", { silent = true })
-- Insert this in your on_attach function
-- vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', {noremap = true, silent = true})
-- vim.cmd [[ autocmd BufWritePre *.ts,*.js lua vim.lsp.buf.formatting() ]]
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", { silent = true })

-- Lua
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

-- Python
lspconfig.pyright.setup {
    capabilities = capabilities,
    filetypes = { "python" },
}

-- Go
lspconfig.gopls.setup {
    capabilities = capabilities,
    cmd = { "gopls", "serve" },
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

lspconfig.sqlls.setup {
    capabilities = capabilities,
    cmd = { "sql-language-server", "up", "--method", "stdio" },
    filetypes = { "sql" },
    root_dir = lspconfig.util.root_pattern(".git", vim.fn.getcwd()),
}

-- Javascript/Typescript
lspconfig.ts_ls.setup {
    capabilities = capabilities,
    init_options = { hostInfo = 'neovim' },
    cmd = { "typescript-language-server", "--stdio" },
    filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
    root_dir = function(fname)
        return lspconfig.util.root_pattern('package.json', 'tsconfig.json', '.git')(fname) or
            lspconfig.util.path.dirname(fname)
    end,
    -- Old config for tsserver not sure if applicable
    -- on_attach = function(client, bufnr)
    --     -- Optional: your additional configurations...
    --     --
    --     client.resolved_capabilities.document_formatting = true
    -- end,
    settings = {
        documentFormatting = false,
        documentFormattingParams = {
            tabSize = 4,
        }
    }
}

-- Angular
local util = require("lspconfig.util")
local root_dir = util.root_pattern("nx.json", "angular.json", "project.json")

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
    root_dir = root_dir,
    capabilities = capabilities,
}

-- Astro
lspconfig.astro.setup {
    -- autostart = true,
    -- capabilities = capabilities,
    -- filetypes = { "astro" },
    -- This is kinda of working but its weird
    -- init_options = {
    --     typescript = {
    --         tsdk = vim.fn.expand("~/my-repos/blog-site/node_modules/typescript/lib")
    --         -- Adjust the path above to point to your project's TypeScript installation
    --     }
    -- }
}

-- for mdx support
vim.filetype.add({
    extension = {
        mdx = "markdown.mdx",
    },
    filename = {},
    pattern = {},
})

-- LSP finder - Find the symbol's definition
-- If there is no definition, it will instead be hidden
-- When you use an action in finder like "open vsplit",
-- you can use <C-t> to jump back
keymap("n", "gh", "<cmd>Lspsaga finder<CR>")

-- Code action
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>")

-- Rename all occurrences of the hovered word for the entire file
keymap("n", "gr", "<cmd>Lspsaga rename<CR>")

-- Rename all occurrences of the hovered word for the selected files
keymap("n", "gr", "<cmd>Lspsaga rename ++project<CR>")

-- Peek definition
-- You can edit the file containing the definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gp", "<cmd>Lspsaga peek_definition<CR>")

-- Go to definition
keymap("n", "gd", "<cmd>Lspsaga goto_definition<CR>")

-- Peek type definition
-- You can edit the file containing the type definition in the floating window
-- It also supports open/vsplit/etc operations, do refer to "definition_action_keys"
-- It also supports tagstack
-- Use <C-t> to jump back
keymap("n", "gt", "<cmd>Lspsaga peek_type_definition<CR>")

-- Go to type definition
keymap("n", "gt", "<cmd>Lspsaga goto_type_definition<CR>")


-- Show line diagnostics
-- You can pass argument ++unfocus to
-- unfocus the show_line_diagnostics floating window
keymap("n", "<leader>ll", "<cmd>Lspsaga show_line_diagnostics<CR>", { desc = "Show Line Diagnostics" })

-- Show buffer diagnostics
keymap("n", "<leader>lb", "<cmd>Lspsaga show_buf_diagnostics<CR>")

-- Show workspace diagnostics
keymap("n", "<leader>lw", "<cmd>Lspsaga show_workspace_diagnostics<CR>")

-- Show cursor diagnostics
keymap("n", "<leader>lc", "<cmd>Lspsaga show_cursor_diagnostics<CR>")

-- Diagnostic jump
-- You can use <C-o> to jump back to your previous location
keymap("n", "[e", "<cmd>Lspsaga diagnostic_jump_prev<CR>")
keymap("n", "]e", "<cmd>Lspsaga diagnostic_jump_next<CR>")

-- Diagnostic jump with filters such as only jumping to an error
keymap("n", "[E", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Diagnostic Jump Prev" })

keymap("n", "]E", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { desc = "Diagnostic Jump Next" })

-- Toggle outline
keymap("n", "<leader>o", "<cmd>Lspsaga outline<CR>")

-- Hover Doc
-- If there is no hover doc,
-- there will be a notification stating that
-- there is no information available.
-- To disable it just use ":Lspsaga hover_doc ++quiet"
-- Pressing the key twice will enter the hover window
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>")

-- If you want to keep the hover window in the top right hand corner,
-- you can pass the ++keep argument
-- Note that if you use hover with ++keep, pressing this key again will
-- close the hover window. If you want to jump to the hover window
-- you should use the wincmd command "<C-w>w"
keymap("n", "K", "<cmd>Lspsaga hover_doc ++keep<CR>")

-- Call hierarchy
keymap("n", "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>")
keymap("n", "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>")

-- Floating terminal
keymap({ "n", "t" }, "<c-\\>", "<cmd>Lspsaga term_toggle<CR>")

-- Format code
keymap('n', '<leader>lf', '<cmd>lua vim.lsp.buf.format()<CR>', { desc = "Format Code", noremap = true, silent = true })
