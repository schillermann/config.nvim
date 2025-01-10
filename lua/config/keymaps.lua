-- File Explorer
vim.keymap.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
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
