local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "

-- File Explorer
vim.keymap.set("n", "<leader>e", ":Lexplore<CR>", { desc = "Open file explorer" })
-- Jump To Window
vim.keymap.set("n", "<C-h>", "<c-w>h", { desc = "Jump to window left" })
vim.keymap.set("n", "<C-j>", "<c-w>j", { desc = "Jump to window down" })
vim.keymap.set("n", "<C-k>", "<c-w>k", { desc = "Jump to window up" })
vim.keymap.set("n", "<C-l>", "<c-w>l", { desc = "Jump to window right" })
-- Resize Window
vim.keymap.set("n", "<C-S-Up>", "<CMD>resize +2<CR>", { desc = "Increases the size of the horizontal window" })
vim.keymap.set("n", "<C-S-Down>", "<CMD>resize -2<CR>", { desc = "Decreases the size of the horizontal window" })
vim.keymap.set("n", "<C-S-Right>", "<CMD>vertical resize +2<CR>", { desc = "Increases the size of the vertical window" })
vim.keymap.set("n", "<C-S-Left>", "<CMD>vertical resize -2<CR>", { desc = "Decreases the size of the vertical window" })
-- Buffer Navigation
vim.keymap.set("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Jump to the next buffer" })
vim.keymap.set("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Jump to the previous buffer" })
-- Package Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })
-- Package Copilot Chat
vim.keymap.set({ "n", "v" }, "<leader>aa", "<CMD>CopilotChatToggle<CR>", { desc = "Open and close Copilot Chat" })
vim.keymap.set({ "n", "v" }, "<leader>ar", "<CMD>CopilotChatReset<CR>", { desc = "Reset Copilot Chat window" })
function openQuickCopilotChat()
  local input = vim.fn.input("Quick Chat: ")
  if input ~= "" then
    require("CopilotChat").ask(input)
  end
end
vim.keymap.set({ "n", "v" }, "<leader>aq", openQuickCopilotChat, { desc = "Open quick Copilot Chat" })
