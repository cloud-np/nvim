-- Setup which-key
local wk = require("which-key")

wk.setup()

-- Define prefix descriptions using the register method
wk.register({
  b = { name = "Buffer Management" },
  l = { name = "Lsp Operations" },
  g = { name = "Git" },
  r = { name = "Refactoring with Lsp" },
  c = { name = "Lsp Stuff" },
  d = { name = "Dap" },
  s = { name = "Search" },
}, { prefix = "<leader>" })
