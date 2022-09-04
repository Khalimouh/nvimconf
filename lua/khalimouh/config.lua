
--vim.g.tokyonight_style = "night"
vim.o.background = "dark"
vim.g.edge_style = "aura"
vim.g.edge_better_performance = 1
local colorscheme = "edge"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
