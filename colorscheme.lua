-- Define core colors
local green = "#44AD56" -- Classic Matrix/Terminal Green
local black = "#000000"

-- Set base colors
vim.api.nvim_set_hl(0, "Normal", { fg = green, bg = black })
vim.api.nvim_set_hl(0, "NonText", { fg = green, bg = black })

-- Iterates through every syntax group and forces it to be green
-- but PRESERVES the structural formatting (bold, italic, etc.)
local function apply_monochrome()
    local highlights = vim.api.nvim_get_hl(0, {})
    
    for name, hl in pairs(highlights) do
        -- Link groups to Normal to inherit green/black, but keep attributes
        vim.api.nvim_set_hl(0, name, {
            fg = green,
            bold = hl.bold,
            italic = hl.italic,
            underline = hl.underline,
            undercurl = hl.undercurl,
        })
    end
end

apply_monochrome()

-- Make code structure bold
vim.api.nvim_set_hl(0, "@keyword", { fg = green, bold = true })
vim.api.nvim_set_hl(0, "@function", { fg = green, bold = true, underline = true })

-- Make documentation/comments stand out with italics
vim.api.nvim_set_hl(0, "@comment", { fg = green, italic = true })
vim.api.nvim_set_hl(0, "@parameter", { fg = green, italic = true })


-- Stay visible: Visual Mode, Search highlight, CursorLine 
vim.api.nvim_set_hl(0, "Visual", { bg = "#004400", fg = "NONE" }) -- Dark green highlight
vim.api.nvim_set_hl(0, "Search", { bg = green, fg = black })     -- Inverted for search
