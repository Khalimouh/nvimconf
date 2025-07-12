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
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
}
