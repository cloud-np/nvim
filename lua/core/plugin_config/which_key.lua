-- Setup which-key
local wk = require("which-key")

wk.setup()

wk.add({
  { "<leader>b", group = "Buffer / Bookmarks" },
  { "<leader>c", group = "Lsp Stuff" },
  { "<leader>d", group = "Dap" },
  { "<leader>g", group = "Git" },
  { "<leader>l", group = "Lsp Operations" },
  { "<leader>r", group = "Refactoring with Lsp" },
  { "<leader>s", group = "Search" },
})
