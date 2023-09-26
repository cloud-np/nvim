-- Define prefix descriptions
local prefix_descriptions = {
  ["<leader>b"] = "Buffer Management",
  ["<leader>l"] = "Lsp Operations",
  ["<leader>g"] = "Git",
  ["<leader>r"] = "Refactoring with Lsp",
  ["<leader>c"] = "Lsp Stuff Have to check again lol",
  ["<leader>d"] = "Dap",
  ["<leader>s"] = "Search",
}

-- Register these prefix descriptions
for prefix, description in pairs(prefix_descriptions) do
  require("which-key").register({ [prefix] = { name = description } })
end
