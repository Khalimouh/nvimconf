local augroup = zebi.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"
local opts = {
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.yamlfmt,
        null_ls.builtins.formatting.buf,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.formatting.scalafmt,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.terragrunt_fmt,
        null_ls.builtins.formatting.sqlfluff.with {
            extra_args = { "--dialect", "biguqery" }, -- change to your dialect
        },
        -- Diagnostics
        null_ls.builtins.diagnostics.pylint.with {
            command = "./.venv/bin/pylint",
            filetypes = { "python" },
            root_dir = { ".git", "pyproject.toml", ".pylintrc", "setup.py", ".venv" },
        },
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.diagnostics.sqlfluff,
    },
    on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
            zebi.api.nvim_clear_autocmds {
                group = augroup,
                buffer = bufnr,
            }
            zebi.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    zebi.lsp.buf.format { bufnr = bufnr }
                end,
            })
        end
    end,
}
return opts
