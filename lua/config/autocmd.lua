local autoCmdGroup = vim.api.nvim_create_augroup("autoCmdGroup", {})

-- Create an augroup to manage the autocommand
local format_on_save_group = vim.api.nvim_create_augroup("FormatOnSave", {clear = true})

-- Function to check if Prettier is installed
local function is_prettier_not_installed()
  local handle = io.popen("NODE_NO_WARNINGS=1 npm list -g prettier --depth=0")
  local result = handle:read("*a")
  handle:close()
  return result:find("empty")
end

-- Define a function to format with Prettier
local function format_with_prettier()
  if is_prettier_not_installed() then
    vim.notify("Install prettier for file formatting with: npm install -g prettier")
    return
  end
  -- Run Prettier with the current buffer
  vim.cmd("silent! !prettier --write " .. vim.fn.shellescape(vim.api.nvim_buf_get_name(0)))
end

-- Define the autocommand
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {
    "*.cjs",
    "*.css",
    "*.cts",
    "*.flow",
    "*.graphql",
    "*.hbs",
    "*.htm",
    "*.html",
    "*.js",
    "*.json",
    "*.jsx",
    "*.md",
    "*.mjs",
    "*.scss",
    "*.ts",
    "*.tsx",
    "*.vue",
    "*.yaml",
    "*.yml"
  },
  callback = format_with_prettier,
  group = format_on_save_group,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = autoCmdGroup,
  callback = function()
    vim.highlight.on_yank()
  end,
})


vim.api.nvim_create_autocmd("LspAttach", {
  group = autoCmdGroup,
  callback = function(event)
    local client = vim.lsp.get_client_by_id(event.data.client_id)
    if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
      local highlight_augroup = vim.api.nvim_create_augroup("LspHighlight", { clear = false })
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = event.buf,
        group = highlight_augroup,
        callback = vim.lsp.buf.clear_references,
      })

      vim.api.nvim_create_autocmd("LspDetach", {
        group = autoCmdGroup,
        callback = function(event2)
          vim.lsp.buf.clear_references()
          vim.api.nvim_clear_autocmds { group = autoCmdGroup, buffer = event2.buf }
        end,
      })
    end
  end,
})
