zebi.g.base46_cache = zebi.fn.stdpath "data" .. "/base46/"
zebi.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = zebi.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not zebi.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  zebi.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

zebi.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(zebi.g.base46_cache .. "defaults")
dofile(zebi.g.base46_cache .. "statusline")

require "options"
require "autocmds"

zebi.schedule(function()
  require "mappings"
end)
