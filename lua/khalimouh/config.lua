vim.notify = require("notify")

require("toggleterm").setup {
    winbar = {
        enabled = false,
        name_formatter = function(term) --  term: Terminal
            return term.name
        end
    },
}

require("todo-comments").setup {}

-- vim.cmd('colorscheme github_dark_default')
require("catppuccin").setup({
    flavour = "mocha" -- latte, frappe, macchiato, mocha
})

vim.cmd.colorscheme "catppuccin"
