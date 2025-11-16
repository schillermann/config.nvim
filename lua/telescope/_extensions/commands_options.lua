local command_list = require("telescope._extensions.command_list")

return require("telescope").register_extension({
  exports = {
    commands_options = function(opts)
      command_list.picker("commands_options.json", "Commands Options", { 25, 0 }, opts):find()
    end
  },
})
