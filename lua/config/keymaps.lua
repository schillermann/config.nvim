local autoCmdGroup = vim.api.nvim_create_augroup("KeymapGroup", {})
local map = vim.keymap

vim.keymap.set('n', 'd', '"_d', { desc = 'Delete selection' })
vim.keymap.set('n', 'dd', '"_dd', { desc = 'Delete line' })

-- Remap original key maps
-- Completion
map.set("n", "]s", "]s", { desc = "Jump to next misspelled world" })
map.set("n", "[s", "[s", { desc = "Jump to previews misspelled world" })
map.set("n", "z=", "z=", { desc = "Spell word check suggestions" })
map.set("i", "<C-n>", "<C-n>", { desc = "Next keyword completion based on current buffers" })
map.set("i", "<C-p>", "<C-p>", { desc = "Previous keyword completion based on current buffers" })
map.set("i", "<C-x><C-o>", "<C-x><C-o>", { desc = "Code omni mode completion" })
map.set("i", "<C-x><C-f>", "<C-x><C-f>", { desc = "File completion" })
map.set("i", "<C-x><C-l>", "<C-x><C-l>", { desc = "Line completion based on current buffer" })
map.set("i", "<C-x><C-k>", "<C-x><C-k>", { desc = "Dictionary word completion" })
map.set("i", "<C-x><C-s>", "<C-x><C-s>", { desc = "Spell word completion" })
map.set("i", "<C-x><C-t>", "<C-x><C-t>", { desc = "Thesaurus word complete" })
map.set("i", "<C-x><C-i>", "<C-x><C-i>", { desc = "Identifiers completion based on current buffer and included files" })
map.set("v", '"+y', '"+y', { desc = "Copy text to clipboard" })
-- LSP
map.set({ "n", "x" }, "gra", vim.lsp.buf.code_action, { desc = "LSP select a code action" })
map.set("n", "gri", vim.lsp.buf.implementation, { desc = "LSP list implementations to the symbol" })
map.set("n", "grn", vim.lsp.buf.rename, { desc = "LSP rename all references to the symbol" })
map.set("n", "grr", vim.lsp.buf.references, { desc = "LSP list references to the symbol" })
map.set("n", "grt", vim.lsp.buf.type_definition, { desc = "LSP go to the definition of the type of the symbol" })
map.set("n", "gO", vim.lsp.buf.document_symbol, { desc = "Lists all symbols in the current buffer" })
map.set("n", "grs", vim.lsp.buf.signature_help, { desc = "LSP signature information" })
-- Scroll
map.set("i", "<C-y>", "<C-y>", { desc = "Scroll up a line" })
map.set("i", "<C-e>", "<C-e>", { desc = "Scroll down a line" })
map.set("i", "<C-u>", "<C-u>", { desc = "Scroll up half a page" })
map.set("i", "<C-d>", "<C-d>", { desc = "Scroll down half a page" })
map.set("i", "<C-b>", "<C-b>", { desc = "Scroll up a full page" })
map.set("i", "<C-f>", "<C-f>", { desc = "Scroll down a full page" })

-- Fold
map.set("n", "za", "za", { desc = "Toggle fold under cursor" })
map.set("n", "zc", "zc", { desc = "Close fold under cursor" })
map.set("n", "zC", "zC", { desc = "Close all folds under cursor" })
map.set("n", "zo", "zo", { desc = "Open fold under cursor" })
map.set("n", "zO", "zO", { desc = "Open all folds under cursor" })
map.set("n", "zM", "zM", { desc = "Close all folds" })
map.set("n", "zR", "zR", { desc = "Open all folds" })
map.set("n", "zm", "zm", { desc = "Fold more" })
map.set("n", "zr", "zr", { desc = "Reduce folding" })
map.set("n", "zx", "zx", { desc = "Update folds" })
map.set("n", "zv", "zv", { desc = "Open enough folds to view cursor line" })

-- Search
map.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
-- File Explorer
map.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
-- Buffer Navigation
map.set("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Jump to the next buffer" })
map.set("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Jump to the previous buffer" })
-- Terminal
map.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- Package Telescope
local builtin = require("telescope.builtin")
map.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- Package Copilot Chat
map.set({ "n", "v" }, "<leader>aa", "<CMD>CopilotChatToggle<CR>", { desc = "Open and close Copilot Chat" })
map.set({ "n", "v" }, "<leader>ar", "<CMD>CopilotChatReset<CR>", { desc = "Reset Copilot Chat window" })
-- LSP
vim.api.nvim_create_autocmd("LspAttach", {
  group = autoCmdGroup,
  callback = function(event)
    -- LSP
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration,
      { buffer = event.buf, desc = "LSP [g]oto [D]eclaration where the symbol is first introduced" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,
      { buffer = event.buf, desc = "LSP [g]oto [d]efinition where the function is defined" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = event.buf, desc = "LSP show hover information" })
    vim.keymap.set("n", "<leader>cf", vim.lsp.buf.format, { buffer = event.buf, desc = "LSP [c]ode [f]ormat" })
    vim.keymap.set("n", "<leader>sw", vim.lsp.buf.workspace_symbol,
      { buffer = event.buf, desc = "LSP list [s]ymbols in [w]orkspace" })
    vim.keymap.set("n", "<leader>si", vim.lsp.buf.incoming_calls,
      { buffer = event.buf, desc = "LSP list [s]ymbol [i]ncoming calls" })
    vim.keymap.set("n", "<leader>so", vim.lsp.buf.outgoing_calls,
      { buffer = event.buf, desc = "LSP list [s]ymbol [o]utgoing calls" })

    -- Diagnostics
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.setloclist,
      { buffer = event.buf, desc = "[d]iagnostic quickfix [l]ist" })
    vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, { buffer = event.buf, desc = "[d]iagnostic [f]loat" })
  end,
})
-- Package Gitsigns
require("gitsigns").setup({
  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")

    -- Navigation
    vim.keymap.set("n", "]c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "]c", bang = true })
      else
        gitsigns.nav_hunk("next")
      end
    end, { buffer = bufnr, desc = "Gitsigns next hunk" })

    vim.keymap.set("n", "[c", function()
      if vim.wo.diff then
        vim.cmd.normal({ "[c", bang = true })
      else
        gitsigns.nav_hunk("prev")
      end
    end, { buffer = bufnr, desc = "Gitsigns preview hunk" })
  end,
})
-- Package Browse
vim.keymap.set("n", "<leader>b", function()
  require("browse").browse()
end)
