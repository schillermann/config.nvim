require("config.options")
require("config.keymaps")
require("config.autocmd")
require("config.commands")
require("nvim-statusline")
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
require("telescope").setup()
require("blink.cmp").setup({
  completion = {
    accept = {
      auto_brackets = {
        enabled = true,
      },
    },
    menu = {
      draw = {
        treesitter = { "lsp" },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },
  keymap = {
    ["<CR>"] = { "accept", "fallback" },
    ["<Tab>"] = { "select_next", "fallback" },
    ["<S-Tab>"] = { "select_prev", "fallback" },
  },
  sources = {
    cmdline = {},
  },
  signature = { enabled = true }
})
local capabilities = require("blink.cmp").get_lsp_capabilities()
local lspconfig = require("lspconfig")
-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ts_ls
lspconfig.ts_ls.setup({ capabilities = capabilities })

require("gitsigns").setup({
  on_attach = function(bufnr)
    local gitsigns = require("gitsigns")
    vim.keymap.set("n", "[c", gitsigns.prev_hunk, { buffer = bufnr, desc = "Gitsigns preview hunk" })
    vim.keymap.set("n", "]c", gitsigns.next_hunk, { buffer = bufnr, desc = "Gitsigns next hunk" })
  end,
})

require("copilot").setup({
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<Tab>"
    }
  }
})
require("CopilotChat").setup({
  question_header = "## Mario ",
  mappings = {
    reset = {
      normal = "ge",
      insert = false,
    },
  }
})

vim.cmd("packadd today")
require("today").setup()
