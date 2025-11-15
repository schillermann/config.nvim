local command_list = require("telescope._extensions.command_list")

return require("telescope").register_extension({
  exports = {
    commands_ex = function(opts)
      command_list.picker("commands_ex.json", "Ex-Commands Index", opts):find()
    end
  },
})
