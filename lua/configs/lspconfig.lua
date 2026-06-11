vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local map = function(lhs, rhs)
            vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true })
        end

        map("gD", vim.lsp.buf.declaration)
        map("gd", require("telescope.builtin").lsp_definitions)
        map("K", vim.lsp.buf.hover)
        map("gi", require("telescope.builtin").lsp_implementations)
        map("gr", require("telescope.builtin").lsp_references)
        map("<C-k>", vim.lsp.buf.signature_help)
        map("<space>D", require("telescope.builtin").lsp_type_definitions)
        map("<space>rn", vim.lsp.buf.rename)
        map("<space>ca", vim.lsp.buf.code_action)
        map("<space>f", vim.lsp.buf.format)
    end,
})

vim.lsp.config("basedpyright", {
    settings = {
        basedpyright = {
            typeCheckingMode = "standard",
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                venvPath = ".", -- directory containing the venv
                venv = ".venv", -- venv folder name
            },
        },
    },
})

-- Golang Configuration
vim.lsp.config("gopls", {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
        gopls = {
            -- Complétion
            completeUnimported = true,
            usePlaceholders = true,

            -- Analyses statiques
            analyses = {
                unusedparams = true,
                unusedvariable = true,
                unusedwrite = true,
                useany = true,
                nilness = true,
                shadow = true,
            },

            -- Hints (inlay hints)
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },

            -- Staticcheck (linter supplémentaire)
            staticcheck = true,

            -- Formatage
            gofumpt = true, -- plus strict que gofmt (nécessite gofumpt installé)

            -- Semantic tokens (meilleure coloration syntaxique)
            semanticTokens = true,

            -- Code lens (références, tests, benchmarks inline)
            codelenses = {
                gc_details = true,      -- détails du garbage collector
                generate = true,        -- go generate
                regenerate_cgo = true,
                run_govulncheck = true, -- vérification des vulnérabilités
                test = true,
                tidy = true,            -- go mod tidy
                upgrade_dependency = true,
                vendor = true,
            },
        },
    },
})

local servers = { "bashls", "lua_ls", "terraformls", "tflint", "basedpyright" ,"jqls", "gopls"}
for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end
