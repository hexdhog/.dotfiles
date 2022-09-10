local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL --
-- move between windows
map("n", "<leader>h", "<C-w>h")
map("n", "<leader>j", "<C-w>j")
map("n", "<leader>k", "<C-w>k")
map("n", "<leader>l", "<C-w>l")

-- resize windows
map("n", "<S-Up>", ":resize +2<CR>")
map("n", "<S-Down>", ":resize -2<CR>")
map("n", "<S-Left>", ":vertical resize +2<CR>")
map("n", "<S-Right>", ":vertical resize -2<CR>")

map("n", "<leader>+", ":exe \"resize \" . (winheight(0) * 3/2)<CR>")
map("n", "<leader>-", ":exe \"resize \" . (winheight(0) * 2/3)<CR>")

-- disable highlight
map("n", "<C-g>", ":noh<CR>")

-- jump to previous file
map("n", "<leader>o", ":e#<CR>")

-- navigate buffers
-- map("n", "<C-k>", ":bnext<CR>") -- disabled this in favour of nvim-cmp
-- map("n", "<C-j>", ":bprevious<CR>") -- disabled this in favour of nvim-cmp

-- navigate tabs
map("n", "<C-l>", ":tabnext<CR>")
map("n", "<C-h>", ":tabprevious<CR>")

-- wq aliases
vim.cmd [[ cnoreabbrev W w ]]
vim.cmd [[ cnoreabbrev Q q ]]
vim.cmd [[ cnoreabbrev Wq wq ]]
vim.cmd [[ cnoreabbrev wQ wq ]]
vim.cmd [[ cnoreabbrev WQ wq ]]

-- copy to clipboard
map("v", "<leader>y", "\"+y")
map("n", "<leader>Y", "\"+yg_")
map("n", "<leader>y", "\"+yy")

-- paste from clipboard
map("n", "<leader>p", "\"+p")
map("n", "<leader>P", "\"+P")
map("v", "<leader>p", "\"+p")
map("v", "<leader>P", "\"+P")

-- VISUAL --
-- indent while in visual mode
map("v", ">", ">gv")
map("v", "<", "<gv")

-- move selected block
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

-- maintain copied text after visual paste
map("v", "p", '"_dP')

-- PLUGIN REMAPS --
-- Telescope
map("n", "<C-p>", ":lua require('telescope.builtin').find_files()<CR>")
map("n", "<leader>fg", ":lua require('telescope.builtin').live_grep()<CR>")
map("n", "<leader>fb", ":lua require('telescope.builtin').buffers()<CR>")
map("n", "<leader>fh", ":lua require('telescope.builtin').help_tags()<CR>")

-- nvimtree
map("n", "<C-o>", ":NvimTreeToggle<CR>")
