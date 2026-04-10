require("mason").setup()
-- Handles LSPs only
require("mason-lspconfig").setup {
  automatic_enable = {
    "lua_ls",
  }
}
-- Handles everything else (formatters, linters, debuggers)
require("mason-tool-installer").setup({
  ensure_installed = {
    "stylua",
  },
})
