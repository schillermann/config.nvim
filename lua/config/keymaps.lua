local opts = {}
local keymap = vim.api.nvim_set_keymap
vim.g.mapleader = " "

keymap("n", "<leader>e", ":Lexplore <cr>", opts)
