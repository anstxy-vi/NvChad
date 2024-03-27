---@type MappingsTable
local M = {}

M.general = {
  i = {
    ["<C-s>"] = { "<ESC>", "Save" },
  },
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
