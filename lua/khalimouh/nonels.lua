local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        -- null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.formatting.terraform_fmt,
    },
    vim.keymap.set("n", "<space>gf", vim.lsp.buf.format, {})
})
