require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")
map("i", "<C-s>", "<cmd> w <cr>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
map("n", "<C-p>", "<cmd> Telescope find_files <CR>")


map("n", "<leader>qs", function()
    require("persistence").load()
end, { desc = "load the session for the current directory" })

map("n", "<leader>qS", function()
    require("persistence").select()
end, { desc = "select a session to load" })

map("n", "<leader>ql", function()
    require("persistence").load({ last = true })
end, { desc = "load the last session" })

map("n", "<leader>qd", function()
    require("persistence").stop()
end, { desc = "stop Persistence"})
