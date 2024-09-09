return {
    -- https://github.com/mg979/vim-visual-multi
    {
        "mg979/vim-visual-multi",
        lazy = false,
    },

    -- https://github.com/justinmk/vim-sneak
    -- Jump to any location specified by two characters.
    {
        "justinmk/vim-sneak",
        event = "BufRead"
    },

    -- https://github.com/kkoomen/vim-doge
    {
        "kkoomen/vim-doge",
        event = "BufRead",
        build = function()
            vim.cmd([[call doge#install()]])
        end
    },

    -- https://github.com/folke/persistence.nvim
    -- Persistence is a simple lua plugin for automated session management.
    {
        "folke/persistence.nvim",
        event = "BufReadPre",                              -- this will only start session saving when an actual file was opened
        opts = {
            dir = vim.fn.stdpath("state") .. "/sessions/", -- directory where session files are saved
            -- minimum number of file buffers that need to be open to save
            -- Set to 0 to always save
            need = 1,
            branch = true, -- use git branch to save session
        }
    },

    -- https://github.com/kylechui/nvim-surround
    -- Surround selections, stylishly
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },

    -- https://github.com/dyng/ctrlsf.vim
    -- An ack/ag/pt/rg powered code search and view tool, takes advantage of Vim 8's power to support asynchronous searching, and lets you edit file in-place with Edit Mode.
    {
        'dyng/ctrlsf.vim',
        event = 'BufRead'
    },

    -- https://github.com/0oAstro/dim.lua
    -- dim unused variables and functions using lsp and treesitter.
    {
        'narutoxy/dim.lua',
        dependencies = { "nvim-treesitter/nvim-treesitter", "neovim/nvim-lspconfig" },
        event = "BufRead",
        config = function()
            require('dim').setup({})
        end
    },
}
