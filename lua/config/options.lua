local opt = vim.opt

opt.mouse = ""
opt.scrolloff = 10
opt.relativenumber = false
opt.wrap = false
opt.signcolumn = "yes"

-- Global options
vim.g.mapleader = " "
vim.g.netrw_banner = 0
-- Spell
opt.spelllang = { "en_us", "de_20" }
opt.spell = true
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
