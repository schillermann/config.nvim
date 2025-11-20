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
  for _, w in ipairs(column_widths) do
    if w == 0 then
      table.insert(items, { remaining = true })
    else
      table.insert(items, { width = w })
    end
  end
  return items
end

local function create_picker(list, title, column_widths, opts)
  title = title or "Commands"
  column_widths = column_widths or { 15, 17, 0 }

  local displayer = entry_display.create({
    separator = " │ ",
    items = build_column_items(column_widths),
  })

  local make_display = function(entry)
    return displayer(entry.value)
  end

  return pickers.new(opts or {}, {
    prompt_title = title,
    finder = finders.new_table({
      results = list,
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
      -- Insert selected command into command line
      local function enter(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        actions.close(prompt_bufnr)
        if selection and selection.value then
          vim.api.nvim_feedkeys(":" .. selection.value[1], "n", false)
        end
      end

      map("i", "<CR>", enter)
      map("n", "<CR>", enter)

      return true
    end,
  })
end

function M.picker(filename, title, column_widths, opts)
  if not filename then
    vim.notify("No filename provided to load command list",
      vim.log.levels.ERROR)
    return
  end

  local list = file_json.load("lua/telescope/_extensions/" .. filename)
  return create_picker(list, title, column_widths, opts)
end

function M.multi_picker(filenames, title, column_widths, opts)
  if type(filenames) ~= "table" then
    vim.notify("multi_picker requires a list of filenames", vim.log.levels.ERROR)
    return
  end

  local all = {}

  for _, fname in ipairs(filenames) do
    local list = file_json.load("lua/telescope/_extensions/" .. fname)
    if list then
      for _, item in ipairs(list) do
        table.insert(all, item)
      end
    end
  end

  return create_picker(all, title, column_widths, opts)
end

return M
