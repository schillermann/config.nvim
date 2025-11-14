local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local entry_display = require("telescope.pickers.entry_display")
local json_file = require("json_file")

local function ex_commands(opts)
  opts = opts or {}

  local exCommands = json_file.load("lua/telescope/_extensions/ex_commands.json")

  -- Define column layout
  local displayer = entry_display.create({
    separator = " │ ",
    items = {
      { width = 15 },       -- tag
      { width = 17 },       -- command
      { remaining = true }, -- action fills remaining space
    },
  })

  local make_display = function(entry)
    return displayer({
      entry.value.tag,
      entry.value.command,
      entry.value.action,
    })
  end

  pickers.new(opts, {
    prompt_title = "Ex-Commands Index",
    finder = finders.new_table({
      results = exCommands,
      entry_maker = function(entry)
        return {
          value = entry,
          display = make_display,
          ordinal = table.concat({ entry.tag, entry.command, entry.action }, " "),
        }
      end,
    }),
    sorter = conf.generic_sorter(opts),

    attach_mappings = function(_, map)
      -- Map <CR> to insert the command into the command line
      map("i", "<CR>", function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection and selection.value and selection.value.tag then
          local cmd = selection.value.tag
          -- Open the command-line with the command pre-filled
          vim.api.nvim_feedkeys(":" .. cmd, "n", false)
        end
      end)
      map("n", "<CR>", function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection and selection.value and selection.value.tag then
          local cmd = selection.value.tag
          -- Open the command-line with the command pre-filled
          vim.api.nvim_feedkeys(":" .. cmd, "n", false)
        end
      end)
      return true
    end,
  }):find()
end

return require("telescope").register_extension({
  exports = {
    ex_commands = ex_commands,
  },
})
