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
        opts = function()
            return require "configs.treesitter"
        end,
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
        opts = function()
            return require "configs.mason"
        end,
    },
    {
        "mason-org/mason-lspconfig.nvim",
        lazy = false,
        opts = function()
            return require "configs.mason-lspconfig"
        end,
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
        opts = function()
            return require "configs.mason-null-ls"
        end,
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
            require "configs.noice"
        end,
    },
    {
        "ahmedkhalf/project.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        config = function()
            require "configs.project"
        end,
        keys = {
            { "<leader>tp", "<cmd>Telescope projects<cr>", desc = "Switch project" },
        },
    },
    {
        "MeanderingProgrammer/render-markdown.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        opts = {},
        ft = { "markdown" },
    },
}
