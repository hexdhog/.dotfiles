-- disable unused builtins plugins
local disabled_built_ins = {
	"netrw",
	"netrwPlugin",
	"netrwSettings",
	"netrwFileHandlers",
	"gzip",
	"zip",
	"zipPlugin",
	"tar",
	"tarPlugin",
	"getscript",
	"getscriptPlugin",
	"vimball",
	"vimballPlugin",
	"2html_plugin",
	"logipat",
	"rrhelper",
	"spellfile_plugin",
	"matchit"
}

for _, plugin in pairs(disabled_built_ins) do
	vim.g["loaded_" .. plugin] = 1
end

vim.opt.backup = false								-- do not create a backup file
vim.opt.fileencoding = "utf-8"						-- default file encoding
vim.opt.completeopt = { "menuone", "noselect" }		-- completion menu popup configuration
vim.opt.pumheight = 10								-- pop up menu height
vim.opt.cmdheight = 1								-- more space in the neovim command line for displaying messages
vim.opt.conceallevel = 0							-- so that `` is visible
vim.opt.showmatch = true							-- highlight all matches
vim.opt.incsearch = true							-- highlight all matches while typing
vim.opt.hlsearch = true								-- highlight all matches from previous search pattern
vim.opt.ignorecase = true							-- ignore case in search patterns
vim.opt.smartcase = true							-- use smart case
vim.opt.smartindent = true							-- use smart indent
vim.opt.showmode = false							-- disable current mode visualization (e.g. "-- INSERT --")
vim.opt.showtabline = 2								-- always show tabs
vim.opt.splitbelow = true							-- force all horizontal splits to go below current window
vim.opt.splitright = true							-- force all vertical splits to go to the right of current window
vim.opt.swapfile = false							-- disable swap files
vim.opt.termguicolors = true						-- enable term gui colors
vim.opt.timeoutlen = 1000							-- time to wait for mapped sequence to complete (in miliseconds)
vim.opt.undofile = true								-- enable persistent undo
vim.opt.updatetime = 300							-- faster completion (default = 4000ms)
vim.opt.writebackup = false							-- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
vim.opt.expandtab = false							-- do not convert tabs to spaces
vim.opt.shiftwidth = 4								-- use 4 columns for tabs
vim.opt.tabstop = 4									-- insert 4 columns for tabs
vim.opt.softtabstop = 4								-- insert 4 columns for tabs
vim.opt.cursorline = true							-- enable current line highlighting
vim.opt.number = true								-- enable line numbers
vim.opt.relativenumber = true						-- enable relative line numbers
vim.opt.numberwidth = 4								-- set number column width to 4
vim.opt.signcolumn = "yes"							-- always show the sign column, otherwise it would shift the text each time
vim.opt.wrap = false								-- display lines as one long line
vim.opt.scrolloff = 8								-- always keep 8 lines below/above current cursor
vim.opt.sidescrolloff = 8							-- always keep 8 columns to current cursor
vim.opt.shortmess:append "c"						-- do not give ins-copmpletion-many message
vim.opt.iskeyword:append({ "-" })					-- include "-" in word matches
vim.opt.mouse = "a"									-- allow the mouse to be used in all modes
vim.opt.hidden = true

vim.cmd "set whichwrap+=<,>,[,],h,l"				-- jump to next line when a line end is hit
vim.cmd [[set formatoptions-=cro]]

-- set colorscheme
vim.o.background = "dark"
vim.cmd([[colorscheme gruvbox]])

-- TEMPORARILY DISABLED OPTIONS --
-- vim.opt.guifont = "monospace:h17"					-- font in graphical neovim applications
-- vim.opt.clipboard = "unnamedplus"					-- allow neovim to acces the system clipboard
