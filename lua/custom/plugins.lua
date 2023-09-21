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

  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  {
    "mg979/vim-visual-multi",
    lazy = false,
  },
  
  --  vim scrollbar
  {
    "lewis6991/satellite.nvim",
    lazy = false,
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
  -- {
  --   "Pocco81/auto-save.nvim",
  --   event = "BufRead",
  -- },

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
    event = 'VeryLazy'
  },

  {
    "justinmk/vim-sneak",
    event = "BufRead"
  },

  -- {
  --   'neoclide/coc.nvim',
  --   lazy = false,
  --   branch = 'release'
  -- },

  {
    'sainnhe/sonokai',
    lazy = false,
    config = function()
      vim.cmd([[colorscheme sonokai]])
    end
  }
}

return plugins