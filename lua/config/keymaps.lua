local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "

-- File Explorer
keymap("n", "<leader>e", ":Lexplore <CR>", opts)
-- Jump To Window
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)
-- Resize Window
keymap("n", "<C-S-k>", ":resize +2<CR>", { noremap = true, silent = true, desc = "Increases the size of the horizontal window" })
keymap("n", "<C-S-j>", ":resize -2<CR>", { noremap = true, silent = true, desc = "Decreases the size of the horizontal window" })
keymap("n", "<C-S-l>", ":vertical resize +2<CR>", { noremap = true, silent = true, desc = "Increases the size of the vertical window" })
keymap("n", "<C-S-h>", ":vertical resize -2<CR>", { noremap = true, silent = true, desc = "Decreases the size of the vertical window" })
-- Buffer Navigation
keymap("n", "<S-l>", ":bnext<CR>", { noremap = true, silent = true, desc = "Jump to the next buffer" })
keymap("n", "<S-h>", ":bprevious<CR>", { noremap = true, silent = true, desc = "Jump to the previous buffer" })
-- Package Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { noremap = true, silent = true, desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { noremap = true, silent = true, desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { noremap = true, silent = true, desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { noremap = true, silent = true, desc = 'Telescope help tags' })
