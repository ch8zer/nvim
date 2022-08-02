local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

-- Install your plugins here
-- Find plugins here: http://neovimcraft.com/
return packer.startup(function(use)
    -- My plugins here

    use("wbthomason/packer.nvim") -- Have packer manage itself
    use("nvim-lua/plenary.nvim") -- Useful lua functions used by lots of plugins
    use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter

    -- global plugins
    use 'lewis6991/impatient.nvim'
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    -- Colorschemes
    use("xiyaowong/nvim-transparent")
    use("kyazdani42/nvim-palenight.lua")

    -- Snippets
    use('hrsh7th/nvim-cmp')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-buffer')
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp")

    -- LSP
    use("neovim/nvim-lspconfig") -- enable LSP
    use("williamboman/nvim-lsp-installer") -- simple to use language server installer
    use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
    use("pearofducks/ansible-vim")

    -- -- Telescope
    use( "nvim-telescope/telescope.nvim")

    -- Treesitter
    use("nvim-treesitter/nvim-treesitter")

    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
