return {
    {
        "tpope/vim-fugitive",
        ft = "*",
    },
    {
        "rcarriga/nvim-notify",
        lazy = false,
    },
    {
        "RRethy/vim-illuminate",
        ft = "*",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        ft = "*",
        opts = {
            auto_install = true,
            ensure_installed = {
                "python",
                "go",
                "bash",
                "terraform",
                "scala",
                "java",
                "jq",
                "yaml",
                "csv",
                "dockerfile",
                "dot",
                "git_config",
                "git_rebase",
                "gitattributes",
                "gitcommit",
                "gitignore",
                "gomod",
                "gosum",
                "gotmpl",
                "gowork",
                "helm",
                "html",
                "http",
                "json",
                "kotlin",
                "lua",
                "sql",
                "xml",
            },
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        ft = "*",
    },
    {
        "mason-org/mason.nvim",
        lazy = false,
        opts = {
            ui = {
                icons = {
                    package_installed = "✓",
                    package_pending = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        opts = {
            ensure_installed = {
                "pyright",
                "lua_ls",
                "bashls",
                "gopls",
                "terraformls",
                "jqls",
                "tflint",
            },
            automatic_enable = false
        },
    },
    {
        "neovim/nvim-lspconfig",
         config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "nvimtools/none-ls.nvim",
        ft = { "*" },
        opts = function()
            return require "configs.null-ls"
        end,
    },
    {
        "jay-babu/mason-null-ls.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
            "nvimtools/none-ls.nvim",
        },
        opts = {
            ensure_installed = {
                "isort",
                "black",
                "pylint",
                "tflint",
                "terraform_fmt",
                "gofumpt",
                "goimports_reviser",
                "golines",
                "golangci_lint",
                "yamllint",
                "yamlfmt",
                "buf",
                "google_java_format",
                "scalafmt",
                "shfmt",
                "scalafmt",
                "sqlfluff",
                "terragrunt_fmt",
            },
            auto_install = true,
        },
    },
    {
        "olexsmir/gopher.nvim",
        ft = "*",
        build = function()
            vim.cmd.GoInstallDeps()
        end,
    },
}
