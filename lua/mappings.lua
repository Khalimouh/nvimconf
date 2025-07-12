require "nvchad.mappings"

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-t>", ":Telescope git_branches <CR>", opts)
map("n", "<C-d>", "<C-d>zz", opts)
map("n", "<C-u>", "<C-u>zz", opts)
map("n", "<C-s>", ":vsplit %<CR>", opts)

-- Navigate buffers
map("n", "<C-b>", ":bnext<CR>", opts)
map("n", "<C-B>", ":bprevious<CR>", opts)

-- Visual --
-- Stay in indent mode
map("v", "<", "<gv", opts)
map("v", ">", ">gv", opts)
map("n", "<leader>td", "<cmd>TodoTelescope<cr>", opts)
map("n", "<leader>tb", "<cmd>Telescope buffers<cr>", opts)

-- Gopher mappings
map("n", "<leader>ge", "<cmd>GoIfErr<cr>", opts)
map("n", "<leader>gj", "<cmd>GoTagAdd json<cr>", opts)
map("n", "<leader>gy", "<cmd>GoTagAdd yaml<cr>", opts)

