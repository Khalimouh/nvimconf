require "nvchad.mappings"

local opts = { noremap = true, silent = true }
local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n","<leader>lr", "<cmd>LspRestart<cr>")
map("n", "<C-t>", "<cmd>Telescope git_branches<cr>", opts)
map("n", "<leader>td", "<cmd>TodoTelescope<cr>", opts)
map("n", "<leader>tb", "<cmd>Telescope buffers<cr>", opts)
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

-- Gopher mappings
map("n", "<leader>ge", "<cmd>GoIfErr<cr>", opts)
map("n", "<leader>gj", "<cmd>GoTagAdd json<cr>", opts)
map("n", "<leader>gy", "<cmd>GoTagAdd yaml<cr>", opts)

-- Terraform mappings
map("n", "<leader>ti", ":!terraform init<CR>", opts)
map("n", "<leader>tv", ":!terraform validate<CR>", opts)
map("n", "<leader>tp", ":!terraform plan<CR>", opts)
map("n", "<leader>taa", ":!terraform apply -auto-approve<CR>", opts)

-- Move text up and down
map("v", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-k>", ":m .-2<CR>==", opts)

-- Visual Block --
-- Move text up and down
map("x", "J", ":move '>+1<CR>gv-gv", opts)
map("x", "K", ":move '<-2<CR>gv-gv", opts)
map("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
map("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
