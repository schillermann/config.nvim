vim.api.nvim_create_user_command("ResizeWindow", function(opts)
  vim.cmd("vertical resize " .. opts.args)
end, { nargs = 1 })

vim.api.nvim_create_user_command("BufferCloseCurrent", function()
  vim.cmd("bp|bd #")
end, { nargs = 0 })

vim.api.nvim_create_user_command('BufferCloseOthers', function()
  local current_buf = vim.api.nvim_get_current_buf()
  local buffers = vim.api.nvim_list_bufs()

  for _, bufnr in ipairs(buffers) do
    if bufnr ~= current_buf and vim.api.nvim_buf_is_loaded(bufnr) and vim.bo[bufnr].buflisted then
      vim.api.nvim_buf_delete(bufnr, { force = false })
    end
  end
end, { desc = 'Close all buffers except the current one' })

