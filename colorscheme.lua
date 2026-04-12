-- ==========================================================================
-- MATRIX MONOCHROME CONFIG (NEOVIM 0.13 - MODERNIZED)
-- ==========================================================================

-- CORE COLORS
local green = "#44AD56" -- Primary Green
local dark_green = "#0d631d" -- Muted Green for comments
local bright_green = "#98FF98" -- Glowing Green for search matches
local black = "#000000"
local selection_bg = "#092009" -- Background for selection/visual mode

-- THEME ENGINE
local function apply_matrix_theme()
	-- Get all active highlight groups
	local hl_groups = vim.fn.getcompletion("", "highlight")

	for _, group_name in ipairs(hl_groups) do
		-- PROTECT: Skip Telescope and the specific Visual/Search UI groups
		if
			group_name ~= ""
			and not group_name:find("^Telescope")
			and group_name ~= "Visual"
			and group_name ~= "Search"
		then
			local lower_name = group_name:lower()
			local opts = { fg = green, force = true }

			-- DARK & CURSIVE: Comments
			if lower_name:find("comment") then
				opts.fg = dark_green
				opts.italic = true

			-- CURSIVE: Strings
			elseif lower_name:find("string") then
				opts.italic = true

			-- BOLD: Keywords and Structure
			elseif
				lower_name:find("statement")
				or lower_name:find("keyword")
				or lower_name:find("local")
				or lower_name:find("cond")
				or lower_name:find("repeat")
				or lower_name:find("type")
				or lower_name:find("storage")
				or lower_name:find("include")
				or lower_name:find("operator")
				or group_name == "Identifier"
			then
				opts.bold = true
			end

			vim.api.nvim_set_hl(0, group_name, opts)
		end
	end

	-- UI OVERRIDES (Set these LAST so the loop doesn't kill them)
	vim.api.nvim_set_hl(0, "Normal", { fg = green, bg = black })
	vim.api.nvim_set_hl(0, "NonText", { fg = green, bg = black })

	-- Telescope Picker Selection Bar
	-- fg = "NONE" preserves the bold/italic green text inside the selection
	vim.api.nvim_set_hl(0, "Visual", { bg = selection_bg, fg = "NONE", force = true })

	vim.api.nvim_set_hl(0, "Search", { bg = green, fg = black, force = true })
	vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = bright_green, bold = true, force = true })
	vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = selection_bg, fg = green, bold = true, force = true })
end

-- FORCE SYNTAX & LSP SETTINGS
vim.api.nvim_create_autocmd({ "FileType", "Syntax", "BufEnter" }, {
	callback = function()
		pcall(vim.treesitter.stop)
		vim.cmd("syntax on")

		local clients = vim.lsp.get_clients()
		for _, client in ipairs(clients) do
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})

-- EXECUTION
vim.api.nvim_create_autocmd({ "FileType", "Syntax", "BufWinEnter" }, {
	callback = function()
		vim.defer_fn(apply_matrix_theme, 20)
	end,
})

-- Run once on startup
apply_matrix_theme()

-- KILL SEMANTIC TOKENS ON ATTACH
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client then
			client.server_capabilities.semanticTokensProvider = nil
		end
	end,
})
