require("config.options")
require("config.keymaps")
require("config.autocmd")
require("config.statusline")
require("nvim-treesitter").setup({
  ensure_installed = {
    "angular",
    "bash",
    "css",
    "diff",
    "dockerfile",
    "git_config",
    "git_rebase",
    "gitattributes",
    "gitcommit",
    "gitignore",
    "html",
    "javascript",
    "json",
    "lua",
    "markdown",
    "markdown_inline",
    "php",
    "typescript",
    "vue",
    "xml",
    "yaml"
  },
  highlight = {
    enable = true,
    -- Disable syntax highlight for large files
    disable = function(lang, buf)
      local max_filesize = 100 * 1024 -- 100 KB
      local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
      if ok and stats and stats.size > max_filesize then
        return true
      end
    end,
  },
})
require("mini.pairs").setup()

local lspconfig = require("lspconfig")
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls
lspconfig.ts_ls.setup({})

require("telescope").setup()
require("CopilotChat").setup({
  mappings = {
    reset = {
      normal = "ge",
      insert = "",
    },
  }
})
