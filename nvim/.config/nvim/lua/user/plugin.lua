local fn = vim.fn

-- automatically install packer
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

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost plugins.lua source <afile> | PackerSync
augroup end
]]

-- use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
	print("ERROR: module 'packer' not found")
	return
end

-- have packer use a popup window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "solid" }
		end,
	},
}

-- install your plugins here
local ret = packer.startup(function(use)
	use "wbthomason/packer.nvim" -- have packer manage itself
	use "nvim-lua/popup.nvim" -- an implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- useful lua functions used ny lots of plugins

	-- colorschemes
	use "ellisonleao/gruvbox.nvim"

	-- misc
	use "lukas-reineke/indent-blankline.nvim"
	use "windwp/nvim-autopairs"
	use "numToStr/Comment.nvim"

	-- file navigation
	use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }
	use { 'kyazdani42/nvim-tree.lua', requires = { 'kyazdani42/nvim-web-devicons' } }

	-- git
	use "lewis6991/gitsigns.nvim"

	-- syntax highlighting
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	-- use "JoosepAlviste/nvim-ts-context-commentstring"
	-- use { "yioneko/nvim-yati", requires = "nvim-treesitter/nvim-treesitter" }

	-- completion & snippets & snippets
	-- use "hrsh7th/nvim-cmp"
	-- use "hrsh7th/cmp-path"
	-- use "hrsh7th/cmp-buffer"
	-- use "hrsh7th/cmp-cmdline"
	-- use "saadparwaiz1/cmp_luasnip"
	-- use "L3MON4D3/LuaSnip"
	-- use "rafamadriz/friendly-snippets"

	-- LSP
	-- use "hrsh7th/cmp-nvim-lsp"
	-- use "neovim/nvim-lspconfig"
	-- use "williamboman/mason.nvim"
	-- use "williamboman/mason-lspconfig.nvim"
	-- use({
		-- 'ray-x/navigator.lua',
		-- requires = {
			-- { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
			-- { 'neovim/nvim-lspconfig' },
		-- },
	-- })

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

require "plugin.indent-blankline"
require "plugin.nvim-tree"
require "plugin.nvim-autopairs"
require "plugin.comment"
require "plugin.gitsigns"
require "plugin.nvim-treesitter"

return ret
