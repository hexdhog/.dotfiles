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
map("n", "<S-Up>", ":resize -2<CR>")
map("n", "<S-Down>", ":resize +2<CR>")
map("n", "<S-Left>", ":vertical resize +2<CR>")
map("n", "<S-Rigth>", ":vertical resize -2<CR>")

map("n", "<leader>+", ":exe \"resize \" . (winheight(0) * 3/2)<CR>")
map("n", "<leader>-", ":exe \"resize \" . (winheight(0) * 2/3)<CR>")

-- disable highlight
map("n", "<C-g>", ":noh<CR>")

-- jump to previous file
map("n", "<leader>p", ":e#<CR>")

-- navigate buffers
map("n", "<C-m>", ":bnext<CR>")
map("n", "<C-n>", ":bprevious<CR>")

-- navigate tabs
map("n", "<C-l>", ":tabnext<CR>")
map("n", "<C-h>", ":tabprevious<CR>")

-- wq aliases
vim.cmd [[ cnoreabbrev ww WriteWithSudo ]]
vim.cmd [[ cnoreabbrev WW WriteWithSudo ]]
vim.cmd [[ cnoreabbrev W w ]]
vim.cmd [[ cnoreabbrev Q q ]]
vim.cmd [[ cnoreabbrev Wq wq ]]
vim.cmd [[ cnoreabbrev wQ wq ]]
vim.cmd [[ cnoreabbrev WQ wq ]]

-- VISUAL --
-- indent while in visual mode
map("v", ">", ">gv")
map("v", "<", "<gv")

-- move selected block
map("n", "K", "")
map("n", "J", "")
map("v", "K", ":m '<-2<CR>gv=gv")
map("v", "J", ":m '>+1<CR>gv=gv")

-- maintain copied text after visual paste
map("v", "p", '"_dP')

-- VISUAL BLOCK --
-- move selected block
-- map("x", "J", ":move '>+1<CR>gv-gv")
-- map("x", "K", ":move '<-2<CR>gv-gv")
-- map("x", "<A-j>", ":move '>+1<CR>gv-gv")
-- map("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- PLUGIN REMAPS --
-- FZF LUA --
map("n", "<C-p>", ":FzfLua files<CR>")
