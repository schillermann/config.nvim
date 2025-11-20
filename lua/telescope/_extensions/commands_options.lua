local command_list = require("telescope._extensions.command_list")

return require("telescope").register_extension({
  exports = {
    commands_options = function(opts)
      local filename = "commands_options.json"
      local title = "Commands Options"
      local column_widths = { 25, 0 }

      local picker = command_list.picker(filename, title, column_widths, opts)

      if picker == nil then
        vim.notify("Missing picker for `Telescope commands_options`",
          vim.log.levels.ERROR)
        return
      end
      picker:find()
    end
  },
})
