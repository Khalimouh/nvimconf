local config = require "nvchad.configs.lspconfig"

local capabilities = config.capabilities
local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", require("telescope.builtin").lsp_definitions, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", require("telescope.builtin").lsp_implementations, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", require("telescope.builtin").lsp_type_definitions, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references, bufopts)
    vim.keymap.set("n", "<space>f", vim.lsp.buf.format, bufopts)
end

local lspconfig = require "lspconfig"
local util = require "lspconfig/util"

--- Pyright Configuration
-- Use vim.lsp.config() to set the options for 'pyright'
vim.lsp.config("pyright", {
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "python" },
})
-- Use vim.lsp.enable() to enable the server config
vim.lsp.enable("pyright")

--- General Servers Configuration
local servers = { "bashls", "lua_ls", "terraformls", "jqls", "tflint" }
for _, lsp in ipairs(servers) do
    -- Use vim.lsp.config() to set common options for each server
    vim.lsp.config(lsp, {
        on_attach = on_attach,
        capabilities = capabilities,
    })
    -- Use vim.lsp.enable() to enable the server config
    vim.lsp.enable(lsp)
end

--- Golang Configuration
-- Use vim.lsp.config() for server-specific options
vim.lsp.config("gopls", {
    on_attach = on_attach,
    capabilities = capabilities,
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    root_dir = util.root_pattern("go.work", "go.mod", ".git"),
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
            },
        },
    },
})
-- Use vim.lsp.enable() to enable the server config
vim.lsp.enable("gopls")
