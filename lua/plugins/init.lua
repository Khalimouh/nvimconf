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
                "basedpyright",
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
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            local noice = require "noice"

            noice.setup {
                cmdline = {
                    view = "cmdline_popup",
                },
                views = {
                    cmdline_popup = {
                        position = {
                            row = vim.o.lines - 5, -- 5 lines from the bottom
                            col = "50%",
                        },
                        size = {
                            width = 60,
                            height = "auto",
                        },
                        border = {
                            style = "rounded",
                        },
                        win_options = {
                            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
                        },
                    },
                },
                lsp = {
                    override = {
                        -- override the default lsp markdown formatter with Noice
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
                        -- override the lsp markdown formatter with Noice
                        ["vim.lsp.util.stylize_markdown"] = false,
                        -- override cmp documentation with Noice (needs the other options to work)
                        ["cmp.entry.get_documentation"] = false,
                    },
                    hover = {
                        enabled = false,
                        silent = true, -- prevents noisy auto popups
                    },
                    signature = {
                        enabled = true,
                        trigger = false,
                        auto_open = false, -- IMPORTANT: stops parameter popup while typing
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
    {
        "ahmedkhalf/project.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require("project_nvim").setup({
                detection_methods = { "pattern" },
                patterns = { ".git" },
                silent_chdir = true,
            })
            require("telescope").load_extension("projects")
        end,
        keys = {
            { "<leader>tp", "<cmd>Telescope projects<cr>", desc = "Switch project" },
        }
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
        ft = { "markdown" },
    },
    {
        "yetone/avante.nvim",
        event = "VeryLazy",
        build = "make",
        dependencies = {
            "nvim-treesitter/nvim-treesitter",
            "stevearc/dressing.nvim",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
        },
        opts = {
            provider = "claude",
            providers = {
                claude = {
                    model = "claude-sonnet-4-6",
                    api_key_name = "ANTHROPIC_API_KEY",
                    extra_request_body = {
                        temperature = 0,
                    },
                },
            },
            windows = {
                position = "right",
            },
        },
    } 
}
