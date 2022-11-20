local function map(mode, lhs, rhs, opts)
	local options = { noremap = true }
	if opts then options = vim.tbl_extend('force', options, opts) end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

local function unmap(mode, lhs)
	pcall(vim.api.nvim_del_keymap, mode, lhs)
end

-- remap space as leader key
map("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL --
-- move between windows
unmap("n", "<leader>h")
unmap("n", "<leader>j")
unmap("n", "<leader>k")
unmap("n", "<leader>l")

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

--  center cursor when <C-u> and <C-d>
map("n", "<C-u>", "<C-u>zz0")
map("n", "<C-d>", "<C-d>zz0")

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
map("n", "<leader>ft", ":lua require('telescope.builtin').help_tags()<CR>")

-- nvimtree
map("n", "<C-o>", ":NvimTreeToggle<CR>")

-- trouble
map("n", "<leader>xx", "<cmd>TroubleToggle<cr>", { silent = true, noremap = true })
map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>", { silent = true, noremap = true })
map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>", { silent = true, noremap = true })
map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", { silent = true, noremap = true })
map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", { silent = true, noremap = true })

-- harpoon
map("n", "<C-f>", "<cmd>lua require(\"harpoon.ui\").toggle_quick_menu()<CR>")
map("n", "<leader>fa", "<cmd>lua require(\"harpoon.mark\").add_file()<CR>")
map("n", "<leader>fn", "<cmd>lua require(\"harpoon.ui\").nav_next()<CR>")
map("n", "<leader>fp", "<cmd>lua require(\"harpoon.ui\").nav_prev()<CR>")
map("n", "<leader>f1", "<cmd>:lua require(\"harpoon.ui\").nav_file(1)<CR>")
map("n", "<leader>f2", "<cmd>:lua require(\"harpoon.ui\").nav_file(2)<CR>")
map("n", "<leader>f3", "<cmd>:lua require(\"harpoon.ui\").nav_file(3)<CR>")
map("n", "<leader>f4", "<cmd>:lua require(\"harpoon.ui\").nav_file(4)<CR>")
map("n", "<leader>f5", "<cmd>:lua require(\"harpoon.ui\").nav_file(5)<CR>")
map("n", "<leader>f6", "<cmd>:lua require(\"harpoon.ui\").nav_file(6)<CR>")
map("n", "<leader>f7", "<cmd>:lua require(\"harpoon.ui\").nav_file(7)<CR>")
map("n", "<leader>f8", "<cmd>:lua require(\"harpoon.ui\").nav_file(8)<CR>")
map("n", "<leader>f9", "<cmd>:lua require(\"harpoon.ui\").nav_file(9)<CR>")

-- git-worktree
map("n", "<leader>fw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
map("n", "<leader>fc", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")

-- diffview
map("n", "<leader>fd", "<cmd>DiffviewOpen<CR>")
map("n", "<leader>fx", "<cmd>DiffviewClose<CR>")
map("n", "<leader>fr", "<cmd>DiffviewRefresh<CR>")
map("n", "<leader>fo", "<cmd>DiffviewToggleFiles<CR>")
