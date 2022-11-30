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
autocmd BufWritePost plugin.lua source <afile> | PackerSync
augroup end
]]

-- use a protected call so we don't error out on first use
local status, packer = pcall(require, "packer")
if not status then
	print("ERROR: module \"packer\" not found")
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

	-- theme
	use "ellisonleao/gruvbox.nvim"
	use "whatyouhide/vim-gotham"
	use "srcery-colors/srcery-vim"
	use "nvim-lualine/lualine.nvim"
	use "alvarosevilla95/luatab.nvim"

	-- PLUGINS TO TRY OUT
	-- use "preservim/nerdcommenter"
	-- use "TimUntersberger/neogit"
	-- use 'norcalli/nvim-colorizer.lua'

	-- misc
	use "lukas-reineke/indent-blankline.nvim"
	use "windwp/nvim-autopairs"
	use "preservim/nerdcommenter"
	use "numToStr/Comment.nvim"
	use "tranvansang/octave.vim"
	use "mg979/vim-visual-multi"

	-- file navigation
	use { "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } }
	use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
	use { "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" } }
	use { "ThePrimeagen/git-worktree.nvim", requires = { "nvim-telescope/telescope.nvim" } }

	-- git
	use "lewis6991/gitsigns.nvim"
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

	-- syntax highlighting
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use { "nvim-treesitter/nvim-treesitter-context", requires = { "nvim-treesitter/nvim-treesitter" } }

	-- completion && lsp
	use "neovim/nvim-lspconfig"
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "hrsh7th/nvim-cmp"
	use "L3MON4D3/LuaSnip"
	use "rafamadriz/friendly-snippets"
	use "ray-x/lsp_signature.nvim"
	use "saadparwaiz1/cmp_luasnip"
	use "williamboman/mason.nvim"
	use "williamboman/mason-lspconfig.nvim"
	use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua", run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)

require "plugin.lualine"
require "plugin.luatab"
require "plugin.indent-blankline"
require "plugin.nvim-tree"
require "plugin.nvim-autopairs"
require "plugin.comment"
require "plugin.gitsigns"
require "plugin.git-worktree"
require "plugin.nvim-treesitter"
require "plugin.lua-snip"
require "plugin.nvim-cmp"
require "plugin.mason"
require "plugin.lspconfig"
require "plugin.trouble"
require "plugin.navigator"

return ret
