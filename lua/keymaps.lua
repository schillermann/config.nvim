local map = vim.keymap

-- search and replace
map.set("n", "sr", ":%s///gI<Left><Left><Left><Left>", { desc = "Search and replace global in file" })
map.set("v", "sr", ":s///gI<Left><Left><Left><Left>", { desc = "Search and replace in selection" })
-- delete without yank
map.set("n", "d", '"_d', { desc = "Delete selection" })
map.set("n", "dd", '"_dd', { desc = "Delete line" })
-- file explorer
map.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
-- buffer navigation
map.set("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Jump to the next buffer" })
map.set("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Jump to the previous buffer" })
-- terminal
map.set("t", "<Esc><Esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- default mappings with description
--  NAVIGATION & INFO
map.set("n", "gd", vim.lsp.buf.definition, { desc = "[G]oto [D]efinition" })
map.set("n", "gD", vim.lsp.buf.declaration, { desc = "[G]oto [D]eclaration" })
map.set("n", "grr", vim.lsp.buf.references, { desc = "[G]oto [R]eferences" })
map.set("n", "gri", vim.lsp.buf.implementation, { desc = "[G]oto [I]mplementation" })
map.set("n", "gt", vim.lsp.buf.type_definition, { desc = "[G]oto [T]ype Definition" })
map.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
map.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Help" })
-- ACTIONS & REFACTORING
map.set("n", "grn", vim.lsp.buf.rename, { desc = "[G]o [R]e[n]ame" })
map.set("n", "gra", vim.lsp.buf.code_action, { desc = "[G]o [R]ead [A]ctions" })
map.set("n", "gO", vim.lsp.buf.document_symbol, { desc = "[G]oto [O]utline (Symbols)" })
-- DIAGNOSTICS (Errors/Warnings)
map.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous [D]iagnostic" })
map.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next [D]iagnostic" })
map.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show [E]rror messages" })
map.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open [Q]uickfix list" })
