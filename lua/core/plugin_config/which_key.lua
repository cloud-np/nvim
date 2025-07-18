-- Setup which-key with the new v3 API
local wk = require("which-key")

wk.setup()

-- Define prefix descriptions using the new add method
wk.add({
  { "<leader>b", group = "Buffer Management" },
  { "<leader>l", group = "Lsp Operations" },
  { "<leader>g", group = "Git" },
  { "<leader>r", group = "Refactoring with Lsp" },
  { "<leader>c", group = "Lsp Stuff" },
  { "<leader>d", group = "Dap" },
  { "<leader>s", group = "Search" },
})
