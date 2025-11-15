vim.diagnostic.config({
  virtual_text = false,
  float = {
    border = "single",
  },
})

require("config.options")
require("config.keymaps")
require("config.autocmd")
require("config.commands")
require("nvim-statusline")
require("nvim-treesitter.configs").setup({
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
require("telescope").setup({
  defaults = {
    layout_strategy = "vertical",
    layout_config = {
      prompt_position = "top",
    },
  },
})

require("telescope").load_extension("commands_ex")
require("telescope").load_extension("commands_options")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
        },
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
        },
      },
    },
  },
  html = {},
}

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = vim.tbl_keys(servers or {}),
  automatic_installation = false,
  handlers = {
    function(server_name)
      local server = servers[server_name] or {}
      server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
      require("lspconfig")[server_name].setup(server)
    end,
  },
})

require("copilot").setup({
  suggestion = {
    auto_trigger = false,
    keymap = {
      accept_word = "<C-l>",
    },
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

require("browse").setup({
  provider = "google",
  bookmarks = {
    ["mdn References Web APIs"] = "https://developer.mozilla.org/en-US/docs/Web/API/%s"
  }
})
vim.cmd("packadd today")
require("today").setup()
