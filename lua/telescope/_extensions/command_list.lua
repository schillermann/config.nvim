local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local entry_display = require("telescope.pickers.entry_display")
local file_json = require("telescope._extensions.file_json")

local M = {}

local function build_column_items(column_widths)
  local items = {}
  for _, column_width in ipairs(column_widths) do
    if column_width == 0 then
      table.insert(items, { remaining = true })
    else
      table.insert(items, { width = column_width })
    end
  end
  return items
end

function M.picker(filename, title, column_widths, opts)
  title = title or "Commands"
  opts = opts or {}
  column_widths = column_widths or { 15, 17, 0 }

  if not filename then
    vim.notify("No filename provided to load command list", vim.log.levels.ERROR)
    return {}
  end

  local command_list = file_json.load("lua/telescope/_extensions/" .. filename)

  -- Define three column layout
  local displayer = entry_display.create({
    separator = " │ ",
    items = build_column_items(column_widths),
  })

  local make_display = function(entry)
    return displayer(entry.value)
  end

  local picker = pickers.new(opts, {
    prompt_title = title,
    finder = finders.new_table({
      results = command_list,
      entry_maker = function(entry)
        return {
          value = entry,
          display = make_display,
          ordinal = table.concat(entry, " "),
        }
      end,
    }),
    sorter = conf.generic_sorter(opts),

    attach_mappings = function(_, map)
      -- Map <CR> to insert the command into the command line
      map("i", "<CR>", function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection and selection.value then
          local cmd = selection.value[1]
          -- Open the command-line with the command pre-filled
          vim.api.nvim_feedkeys(":" .. cmd, "n", false)
        end
      end)
      map("n", "<CR>", function(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)

        if selection and selection.value then
          local cmd = selection.value[1]
          -- Open the command-line with the command pre-filled
          vim.api.nvim_feedkeys(":" .. cmd, "n", false)
        end
      end)
      return true
    end,
  })

  return picker
end

return M
