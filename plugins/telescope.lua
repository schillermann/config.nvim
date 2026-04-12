vim.pack.add({
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
})

require("telescope").setup({
  defaults = {
    layout_config = {
      width = 0.99,
    },
  },
})

local function command_templates()
	local pickers = require("telescope.pickers")
	local finders = require("telescope.finders")
	local conf = require("telescope.config").values
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	pickers
		.new({}, {
			prompt_title = "Command Templates",
			finder = finders.new_table({
				results = {
					-- { "Description", "Command" }
					-- search
					{ "search and replace global in file", "%s/old/new/g" },
					{ "search and replace confirm global in file", "%s/old/new/gc" },
					{ "search and replace line in file", "s/old/new/g" },
					{ "search and replace confirm line in file", "s/old/new/gc" },
					{ "filter lines in file to quickfix list", "grep pattern %" },
					{ "filter lines in current directory to quickfix list", "grep pattern *" },
					{ "filter lines in current directory recursively to quickfix list", "grep pattern **/*" },
					{ "delete empty lines in file", "g/^$/d" },
					-- key mapped
					{ "check key map exists in all modes", "map keys" },
					{ "check key map exists in normal mode", "nmap keys" },
					{ "check key map exists in visual mode", "vmap keys" },
					{ "check key map exists in insert mode", "imap keys" },
					-- file
					{ "lsp format file", "lua vim.lsp.buf.format()" },
				},
				entry_maker = function(entry)
					return {
						value = entry[2],
						display = string.format("%-30s │ %s", entry[2], entry[1]),
						ordinal = entry[2] .. entry[1],
					}
				end,
			}),
			sorter = conf.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				actions.select_default:replace(function()
					local selection = action_state.get_selected_entry()
					actions.close(prompt_bufnr)

					-- Feed ':' + the template to the command line
					-- 'n' = execute like a normal mode mapping
					-- true = escape the keys (standard behavior)
					local cmd = ":" .. selection.value
					vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(cmd, true, false, true), "n", false)
				end)
				return true
			end,
		})
		:find()
end

vim.keymap.set("n", "gt", command_templates, { desc = "Open command templates" })
