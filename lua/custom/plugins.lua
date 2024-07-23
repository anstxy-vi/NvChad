local overrides = require("custom.configs.overrides")

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
    config = function()
      require "custom.configs.nvim-tree"
    end,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  {
    "justinmk/vim-sneak",
    event = "BufRead"
  },

  --  vim document generator
  {
    "kkoomen/vim-doge",
    event = "BufRead",
    build = function()
      vim.cmd([[call doge#install()]])
    end
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre", -- this will only start session saving when an actual file was opened
    opts = {
      -- add any custom options here
    }
  },

  -- auto save when quit insert mode
  {
    "Pocco81/auto-save.nvim",
    event = "BufRead",
    config = function()
      require("auto-save").setup({
        trigger_events = { "InsertLeave" }
      })
    end
  },

  -- update surround symbol , eg: "" -> ''
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
        -- Configuration here, or leave empty to use defaults
      })
    end
  },

  {
    'dyng/ctrlsf.vim',
    event = 'BufRead'
  },

  {
    "mhinz/vim-startify",
    lazy = false,
    -- config = function()
    --   vim.cmd([[ let g:startify_padding_left = 60 ]])
    -- end
  },
  -- {
  --   'projekt0n/github-nvim-theme',
  --   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require('github-theme').setup({})
  --     -- vim.cmd('colorscheme github_dark_tritanopia')
  --   end,
  -- },
  -- {
  --   "rebelot/kanagawa.nvim",
  --   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     vim.cmd('colorscheme kanagawa-dragon')
  --   end,
  -- },
  -- {
  --   "bluz71/vim-nightfly-colors",
  --   lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     -- vim.cmd('colorscheme nightfly')
  --   end,
  --   },
  -- {
  --   "folke/tokyonight.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   opts = {},
  --   config = function()
  --     vim.cmd('colorscheme tokyonight-night')
  --   end,
  -- },
  {
    "loctvl842/monokai-pro.nvim",
    config = function()
      require("monokai-pro").setup({
                filter = "spectrum", -- classic | octagon | pro | machine | ristretto | spectrum
                override = function()
                  return {
                      Normal = { bg = "#000000" }
                    }
                end
      })
      -- vim.cmd([[colorscheme monokai-pro]])
    end
  },
  {
    'narutoxy/dim.lua',
    dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
    event = "BufRead",
    config = function()
      require('dim').setup({})
    end
  },
}

return plugins
