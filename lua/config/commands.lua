vim.api.nvim_create_user_command("ResizeWindow", function(opts)
  vim.cmd("vertical resize " .. opts.args)
end, { nargs = 1 })

vim.api.nvim_create_user_command("BufferCloseCurrent", function()
  vim.cmd("bp|bd #")
end, { nargs = 0 })
