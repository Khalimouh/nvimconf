-- vim.g.tokyonight_style = "night"
-- vim.o.background = "dark"
-- local colorscheme = "tokyonight"

-- local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
-- if not status_ok then
--     vim.notify("colorscheme " .. colorscheme .. " not found!")
--     return
-- end


require('onedark').setup {
    style = 'warmer'
}
require('onedark').load()
