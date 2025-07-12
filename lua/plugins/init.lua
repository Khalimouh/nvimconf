return {
    {
        "tpope/vim-fugitive",
        lazy = false
    },
    {
      "folke/todo-comments.nvim",
       dependencies = { "nvim-lua/plenary.nvim" },
        opts = {},
        lazy = false
    },
    {
        "neovim/nvim-lspconfig",
            config = function()
        require "configs.lspconfig"
        end,
    },
}
