local opt = vim.opt

vim.g.mapleader = " "
vim.g.netrw_banner = 0
opt.mouse = ""
opt.scrolloff = 10
-- Ignore by path auto completion
opt.wildignore = { "*/.git/*", "*/node_modules/*", "*/dist/*" }
-- Path to find files in project with `:find` command
vim.o.path = ".,**"
-- 2 spaces for tabs
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
-- Focus the new split right
opt.splitright = true
opt.splitbelow = true
-- fold
opt.foldmethod = "marker"
opt.foldmarker = "{,}"
opt.foldlevelstart = 1
opt.foldtext = " "
opt.fillchars = { fold = " " }

vim.cmd("colorscheme tokyonight")
