local command_list = require("telescope._extensions.command_list")

return require("telescope").register_extension({
  exports = {
    commands_all = function(opts)
      local filenames = { "commands_options.json", "commands_ex.json" }
      local title = "All Commands"
      local column_widths = { 25, 20, 0 }

      local picker = command_list.multi_picker(filenames, title, column_widths, opts)

      if picker == nil then
        vim.notify("Missing picker for `Telescope commands_all`",
          vim.log.levels.ERROR)
        return
      end
      picker:find()
    end
  },
})
