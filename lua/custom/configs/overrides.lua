local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    -- "c",
    "markdown",
    "markdown_inline",
    "astro",
    "go"
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",
    "astro-language-server",
    "vetur-vls",
    -- "ESLint"

    "rust-analyzer",
    "gopls"
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
    timeout = 2500
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
