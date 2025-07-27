return {
    {
        "ahmedkhalf/project.nvim",
        ft = "*",
        config = function()
            require("project_nvim").setup {}
        end
    },
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
            automatic_enable = false,
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
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = function(_, opts)
            opts.presets = {
                command_palette = {
                    views = {
                        cmdline_popup = {
                            position = {
                                row = "50%",
                                col = "50%",
                            },
                            size = {
                                min_width = 60,
                                width = "auto",
                                height = "auto",
                            },
                        },
                        popupmenu = {
                            relative = "editor",
                            position = {
                                row = 23,
                                col = "50%",
                            },
                            size = {
                                width = 60,
                                height = "auto",
                                max_height = 15,
                            },
                            border = {
                                style = "rounded",
                                padding = { 0, 1 },
                            },
                            win_options = {
                                winhighlight = { Normal = "Normal", FloatBorder = "NoiceCmdlinePopupBorder" },
                            },
                        },
                    },
                },
            }
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },

        config = function()
            local noice = require "noice"

            noice.setup {
                lsp = {
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
                    },
                },
                presets = {
                    bottom_search = true,         -- use a classic bottom cmdline for search
                    command_palette = true,       -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false,           -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false,       -- add a border to hover docs and signature help
                },
            }
        end,
    },
}
