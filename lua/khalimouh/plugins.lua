local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use { "ray-x/lsp_signature.nvim" }
    use "neovim/nvim-lspconfig"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "L3MON4D3/LuaSnip"
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use("rafamadriz/friendly-snippets")
    use("glepnir/lspsaga.nvim")
    use "williamboman/nvim-lsp-installer" -- simple to use language server installer
    use "nvim-telescope/telescope.nvim"
    use {
        "nvim-treesitter/nvim-treesitter"
    }
    use ({ 'projekt0n/github-nvim-theme' })   -- use 'marko-cerovac/material.nvim'
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "lewis6991/gitsigns.nvim"
    use 'kyazdani42/nvim-web-devicons'
    use 'kyazdani42/nvim-tree.lua'
    use "akinsho/bufferline.nvim"
    use "moll/vim-bbye"
    use 'nvim-lualine/lualine.nvim'
    use 'lewis6991/impatient.nvim'
    use 'mfussenegger/nvim-dap'
    use{
        "lukas-reineke/indent-blankline.nvim",
        tag = "v2.20.8"
    }
    use 'tpope/vim-commentary'
    use 'tpope/vim-fugitive'
    use({ 'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim", "mfussenegger/nvim-dap", } })
    use { 'tpope/vim-dadbod' }
    use { 'kristijanhusak/vim-dadbod-ui' }
    use { 'hrsh7th/nvim-compe' }
    use 'kristijanhusak/vim-dadbod-completion'
    use 'mfussenegger/nvim-jdtls'
    use({
        "mcauley-penney/tidy.nvim",
        config = function()
            require("tidy").setup()
        end
    })
    use {
        "cuducos/yaml.nvim",
        ft = { "yaml" }, -- optional
        requires = {
            "nvim-treesitter/nvim-treesitter",
            "nvim-telescope/telescope.nvim" -- optional
        },
    }
    use "lukas-reineke/lsp-format.nvim"
    use "RRethy/vim-illuminate"
    use 'rcarriga/nvim-notify'
    --Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
