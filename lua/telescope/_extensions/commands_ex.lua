local command_list = require("telescope._extensions.command_list")

return require("telescope").register_extension({
  exports = {
    commands_ex = function(opts)
      local filename = "commands_ex.json"
      local title = "Ex-Commands Index"
      local column_widths = { 15, 17, 0 }

      local picker = command_list.picker(filename, title, column_widths, opts)
      if picker == nil then
        vim.notify("Missing picker for `Telescope commands_ex`",
          vim.log.levels.ERROR)
        return
      end
      picker:find()
    end
  },
})
