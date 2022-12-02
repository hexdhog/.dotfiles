local status, git_worktree = pcall(require, "git-worktree")
if not status then
	print("ERROR: module \"git-worktree\" not found")
	return
end

git_worktree.setup({
	change_directory_command = "cd", -- default: "cd",
	update_on_change = true, -- default: true,
	update_on_change_command = "e .", -- default: "e .",
	clearjumps_on_change = true, -- default: true,
	autopush = false -- default: false,
})

local status, telescope = pcall(require, "telescope")
if not status then
	print("ERROR: module \"telescope\" not found")
	return
end

telescope.load_extension("git_worktree")

vim.keymap.set("n", "<leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<CR>")
vim.keymap.set("n", "<leader>gc", "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<CR>")
