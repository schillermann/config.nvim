local function git_branch_name()
    local handle = io.popen('git rev-parse --abbrev-ref HEAD 2>/dev/null')
    local branch = handle:read("*a")
    handle:close()
    return string.len(branch) > 0 and branch:gsub("\n", "") or "No Branch"
end

local function set_statusline_in_netrw()
  vim.api.nvim_buf_set_option(0, "statusline", " " .. git_branch_name() .. " %=%-14.(%l,%c%V%)")
end

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'netrw',
  callback = set_statusline_in_netrw,
})
vim.api.nvim_buf_set_option(0, "statusline", " %f %h%m%r%=%-14.(󰉻 %P %l,%c%V%)")
