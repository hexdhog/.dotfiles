-- automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = vim.fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd("packadd packer.nvim")
end

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

packer.startup(function(use)
	-- general
	use { "wbthomason/packer.nvim" } -- have packer manage itself
	use { "nvim-lua/popup.nvim" } -- an implementation of the Popup API from vim in Neovim
	use { "nvim-lua/plenary.nvim" } -- useful lua functions used ny lots of plugins

	-- theme
	use { "ellisonleao/gruvbox.nvim" }
	use { "whatyouhide/vim-gotham" }
	use { "srcery-colors/srcery-vim" }
	use { "nvim-lualine/lualine.nvim" }
	use { "alvarosevilla95/luatab.nvim" }
	use { "kyazdani42/nvim-web-devicons" } 

	-- file navigation
	use { "nvim-telescope/telescope.nvim", requires = { "nvim-lua/plenary.nvim" } }
	use { "kyazdani42/nvim-tree.lua", requires = { "kyazdani42/nvim-web-devicons" } }
	use { "ThePrimeagen/harpoon", requires = { "nvim-lua/plenary.nvim" } }
	use { "ThePrimeagen/git-worktree.nvim", requires = { "nvim-telescope/telescope.nvim" } }

	-- misc/utils
	use { "lukas-reineke/indent-blankline.nvim" }
	use { 'norcalli/nvim-colorizer.lua' }
	use { "mg979/vim-visual-multi" }
	use { "windwp/nvim-autopairs" }
	use { "numToStr/Comment.nvim" }

	-- languages
	use { "tranvansang/octave.vim" }

	-- git
	use { "lewis6991/gitsigns.nvim" }
	use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

	-- syntax highlighting
	use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
	use { "nvim-treesitter/nvim-treesitter-context", requires = { "nvim-treesitter/nvim-treesitter" } }

	-- lsp
	use { "neovim/nvim-lspconfig" }
	use { "williamboman/mason.nvim", requires = "neovim/nvim-lspconfig" }
	use { "williamboman/mason-lspconfig.nvim", requires = "williamboman/mason.nvim" }
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "L3MON4D3/LuaSnip"}
	use { "saadparwaiz1/cmp_luasnip" }
	use { "ray-x/lsp_signature.nvim" }

	-- PLUGINS TO TRY OUT
	-- use { "preservim/nerdcommenter"
	-- use { "TimUntersberger/neogit"

end)
