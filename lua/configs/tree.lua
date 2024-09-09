local function on_attach(bufnr)
    local api = require "nvim-tree.api"
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
  
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
  
    -- custom mappings
    vim.keymap.set('n', 'h', api.node.navigate.parent_close, opts('Close Directory'))
    vim.keymap.set('n', 'v', api.node.open.vertical, opts('Open: Vertical Split'))
  end
  
  require("nvim-tree").setup {
    on_attach = on_attach,
    update_focused_file = {
      enable = true
    },
    renderer = {
      highlight_git = "name",
        highlight_diagnostics = "all",
        highlight_opened_files = "all",
        highlight_modified = "all",
        -- highlight_hidden = true,
        highlight_bookmarks = "icon",
    }
  }