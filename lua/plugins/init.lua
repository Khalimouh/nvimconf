return {
    {
        "tpope/vim-fugitive",
        ft = "*",
    },
    {
        "rcarriga/nvim-notify",
    },
    {
        "RRethy/vim-illuminate",
        ft = "*",
    },
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            prefer_git = true,
        },
        override_options = {
            ensure_installed = {
                "python",
                "go",
                "bash",
                "terraform",
                "scala",
                "java",
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
                "terraform_ls",
                "jqls",
            },
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
}
