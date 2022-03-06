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
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- install your plugins here
return packer.startup(function(use)
  use "wbthomason/packer.nvim" -- have packer manage itself
  use "nvim-lua/popup.nvim" -- an implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- useful lua functions used ny lots of plugins
  use { "ellisonleao/gruvbox.nvim" }
  use { 'ibhagwan/fzf-lua', requires = { 'kyazdani42/nvim-web-devicons' }} -- requires: `brew install fzf fd`

  -- automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
