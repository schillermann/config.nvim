vim.g.mapleader = " "
vim.opt.mouse = ""
vim.g.netrw_banner = 0
vim.opt.scrolloff = 10
-- Path to find files in project with `:find` command
vim.o.path = ".,**"
-- 2 spaces for tabs
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
-- Focus the new split
vim.opt.splitright = true
vim.opt.splitbelow = true

vim.cmd("colorscheme tokyonight")
