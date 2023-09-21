-- local autocmd = vim.api.nvim_create_autocmd

-- This is an autocmd which will show only modified buffers and current buffer
-- vim.api.nvim_create_autocmd({ "BufAdd", "BufEnter", "tabnew" }, {
--   callback = function()
--     vim.t.bufs = vim.tbl_filter(function(bufnr)
--       return vim.api.nvim_buf_get_option(bufnr, "modified")
--     end, vim.t.bufs)
--   end,
-- })

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })


-- vim.api.nvim_create_autocmd({ "VimResized" }, {
--   desc = "Resize nvim-tree if nvim window got resized",

--   group = vim.api.nvim_create_augroup("NvimTreeResize", { clear = true }),
--   callback = function()
--       local percentage = 15

--       local ratio = percentage / 100
--       local width = math.floor(vim.go.columns * ratio)
--       vim.cmd("tabdo NvimTreeResize " .. width)
--   end,
-- })