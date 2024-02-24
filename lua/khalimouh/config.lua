-- vim.g.tokyonight_style = "night"
-- vim.o.background = "dark"
-- vim.g.neon_style = "dark"
-- local colorscheme = "tokyonight"

-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--     vim.notify("colorscheme " .. colorscheme .. " not found!")
--     return
-- end
vim.notify = require("notify")

-- vim.g.material_style = "deep ocean"
-- vim.cmd 'colorscheme material'
vim.cmd('colorscheme github_dark_default')
