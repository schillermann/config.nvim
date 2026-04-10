-- auto command prevents ignore global settings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",                   -- Matches every file type
  callback = function()
    vim.opt_local.shiftwidth = 2   -- Size of an indent
    vim.opt_local.tabstop = 2      -- Visual width of a tab character
    vim.opt_local.softtabstop = 2  -- Tab key behavior in insert mode
    vim.opt_local.expandtab = true -- Use spaces instead of tabs
  end,
})

vim.diagnostic.config({
	float = { border = "single" },
})
vim.o.winborder = "single"
