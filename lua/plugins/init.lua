return {
    {
        "tpope/vim-fugitive",
        ft='*'
    },
    {
        "rcarriga/nvim-notify"
    },
    {
        "RRethy/vim-illuminate",
        ft = '*'
    },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
            opts = {},
            ft='*'
    },
    {
        "mason-org/mason.nvim",
        opts = {
            ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
            },
            ensure_installed = {
            "black",
            "isort",
            "pylint",
            "pyright",
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
}
