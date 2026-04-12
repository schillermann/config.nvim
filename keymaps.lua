local map = vim.keymap

-- delete without yank
map.set("n", "d", '"_d', { desc = "Delete selection" })
map.set("n", "dd", '"_dd', { desc = "Delete line" })
-- file explorer
map.set("n", "<leader>e", ":Explore<CR>", { desc = "Open file explorer" })
-- buffer navigation
map.set("n", "<S-l>", "<CMD>bnext<CR>", { desc = "Jump to the next buffer" })
map.set("n", "<S-h>", "<CMD>bprevious<CR>", { desc = "Jump to the previous buffer" })
-- terminal
map.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
