local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require "null-ls"

return {
    sources = {
        -- Go
        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.diagnostics.golangci_lint.with {
            timeout = 10000,
        },

        -- Terraform
        null_ls.builtins.formatting.terraform_fmt,
        null_ls.builtins.formatting.terragrunt_fmt.with {
            condition = function(utils)
                return utils.root_has_file { "terragrunt.hcl", ".terragrunt" }
            end,
        },

        -- SQL (BigQuery dialect)
        null_ls.builtins.formatting.sqlfluff.with {
            extra_args = { "--dialect", "bigquery" },
        },
        null_ls.builtins.diagnostics.sqlfluff.with {
            extra_args = { "--dialect", "bigquery" },
        },

        -- YAML
        null_ls.builtins.formatting.yamlfmt,
        null_ls.builtins.diagnostics.yamllint,

        -- Misc
        null_ls.builtins.formatting.buf,
        null_ls.builtins.formatting.google_java_format,
        null_ls.builtins.formatting.scalafmt,
        null_ls.builtins.formatting.shfmt,
    },
    on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format {
                        bufnr = bufnr,
                        filter = function(c)
                            return c.name == "null-ls"
                        end,
                    }
                end,
            })
        end
    end,
}
