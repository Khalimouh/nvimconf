vim.diagnostic.config {
    virtual_text = {
        prefix = "●",
        source = "if_many",
    },
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
        },
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    float = {
        border = "rounded",
        source = true,
    },
}

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(args)
        local bufnr = args.buf
        local client = vim.lsp.get_client_by_id(args.data.client_id)
        local map = function(lhs, rhs, desc)
            vim.keymap.set("n", lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end

        -- ruff handles lint/format; basedpyright handles hover/types
        if client and client.name == "ruff" then
            client.server_capabilities.hoverProvider = false
            vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr, filter = function(c) return c.name == "ruff" end })
                end,
            })
        end

        if client and client.supports_method "textDocument/inlayHint"
            and type((vim.lsp.inlay_hint or {}).enable) == "function" then
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
        end

        map("gD", vim.lsp.buf.declaration, "Go to declaration")
        map("gd", require("telescope.builtin").lsp_definitions, "Go to definition")
        map("K", vim.lsp.buf.hover, "Hover documentation")
        map("gi", require("telescope.builtin").lsp_implementations, "Go to implementation")
        map("gr", require("telescope.builtin").lsp_references, "Go to references")
        map("<C-k>", vim.lsp.buf.signature_help, "Signature help")
        map("<space>D", require("telescope.builtin").lsp_type_definitions, "Go to type definition")
        map("<space>rn", vim.lsp.buf.rename, "Rename symbol")
        map("<space>ca", vim.lsp.buf.code_action, "Code action")
        map("<space>f", function()
            local clients = vim.lsp.get_clients { bufnr = bufnr }
            local has_null_ls_fmt = vim.iter(clients):any(function(c)
                return c.name == "null-ls" and c.supports_method "textDocument/formatting"
            end)
            vim.lsp.buf.format {
                bufnr = bufnr,
                filter = function(c)
                    if has_null_ls_fmt then
                        return c.name == "null-ls"
                    end
                    return c.name ~= "null-ls"
                end,
            }
        end, "Format buffer")
    end,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/luv/library",
                },
            },
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

vim.lsp.config("basedpyright", {
    root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
    settings = {
        basedpyright = {
            typeCheckingMode = "standard",
            analysis = {
                autoSearchPaths = true,
                useLibraryCodeForTypes = true,
                venvPath = ".",
                venv = ".venv",
                inlayHints = {
                    variableTypes = true,
                    returnTypes = true,
                    callArgumentNames = true,
                    functionReturnTypes = true,
                },
            },
        },
    },
})

vim.lsp.config("terraformls", {
    -- .terraform.lock.hcl is present right after init, before .terraform/ is populated
    root_markers = { ".terraform.lock.hcl", ".terraform", ".git" },
    -- terraform-ls ignores workspace/didChangeConfiguration; settings must go in init_options
    init_options = {
        experimentalFeatures = {
            prefillRequiredFields = true,
        },
        validation = {
            enableEnhancedValidation = true,
        },
        ignoreSingleFileWarning = true,
    },
    -- override the default on_attach from nvim-lspconfig which calls
    -- vim.lsp.codelens.enable() — not available until nvim 0.11.5+
    on_attach = function(_, bufnr)
        if type((vim.lsp.codelens or {}).enable) == "function" then
            vim.lsp.codelens.enable(true, { bufnr = bufnr })
        end
    end,
})

vim.lsp.config("tflint", {
    root_markers = { ".tflint.hcl", ".terraform.lock.hcl", ".git" },
})

vim.lsp.config("gopls", {
    cmd = { "gopls" },
    root_markers = { "go.work", "go.mod", ".git" },
    filetypes = { "go", "gomod", "gowork", "gotmpl" },
    settings = {
        gopls = {
            completeUnimported = true,
            usePlaceholders = true,
            analyses = {
                unusedparams = true,
                unusedvariable = true,
                unusedwrite = true,
                useany = true,
                nilness = true,
                shadow = true,
            },
            hints = {
                assignVariableTypes = true,
                compositeLiteralFields = true,
                compositeLiteralTypes = true,
                constantValues = true,
                functionTypeParameters = true,
                parameterNames = true,
                rangeVariableTypes = true,
            },
            staticcheck = true,
            gofumpt = true,
            semanticTokens = true,
            codelenses = {
                gc_details = true,
                generate = true,
                regenerate_cgo = true,
                run_govulncheck = true,
                test = true,
                tidy = true,
                upgrade_dependency = true,
                vendor = true,
            },
        },
    },
})

local servers = { "bashls", "lua_ls", "terraformls", "tflint", "basedpyright", "ruff", "jqls", "gopls" }
for _, lsp in ipairs(servers) do
    vim.lsp.enable(lsp)
end
