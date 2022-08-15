local status_nvim_tree, nvim_tree = pcall(require, "nvim-tree")
if not status_nvim_tree then
	print("ERROR: module 'nvim-tree' not found")
	return
end

local status_nvim_tree_config, nvim_tree_config = pcall(require, "nvim-tree.config")
if not status_nvim_tree_config then
	print("ERROR: module 'nvim-tree' not found")
	return
end

local tree_cb = nvim_tree_config.nvim_tree_callback

nvim_tree.setup {
	disable_netrw = true,
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	-- auto_close = true, -- deprecated
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	-- update_to_buf_dir = { -- deprecated
	-- enable = true,
	-- auto_open = true,
	-- },
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 35,
		height = 30,
		hide_root_folder = false,
		side = "left",
		-- auto_resize = true, -- deprecated
		mappings = {
			custom_only = false,
			list = {
				{ key = { "l", "<CR>", "o" }, cb = tree_cb "edit" },
				{ key = "h", cb = tree_cb "close_node" },
				{ key = "v", cb = tree_cb "vsplit" },
				{ key = "s", cb = tree_cb "split" },
			},
		},
		number = false,
		relativenumber = false,
	},
	renderer = {
		icons = {
			glyphs = {
				default = "",
				symlink = "",
				git = {
					unstaged = "",
					staged = "S",
					unmerged = "",
					renamed = "➜",
					deleted = "",
					untracked = "U",
					ignored = "◌",
				},
				folder = {
					default = "",
					open = "",
					empty = "",
					empty_open = "",
					symlink = "",
				},
			}
		},
	},
	-- quit_on_open = 0, -- deprecated
	-- git_hl = 1, -- deprecated
	-- disable_window_picker = 0, -- deprecated
	-- root_folder_modifier = ":t", -- deprecated
	-- show_icons = { -- deprecated
	-- git = 1,
	-- folders = 1,
	-- files = 1,
	-- folder_arrows = 1,
	-- tree_width = 30,
	-- },
}
