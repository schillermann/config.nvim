require("mason").setup()
-- Handles LSPs only
require("mason-lspconfig").setup()
-- Handles everything else (formatters, linters, debuggers)
require("mason-tool-installer").setup({
  ensure_installed = {
    "lua_ls",
    "stylua",
  },
})
