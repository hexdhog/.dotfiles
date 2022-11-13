local status, navigator = pcall(require, "navigator")
if not status then
	print("ERROR: module 'navigator' not found")
	return
end

navigator.setup({
	debug = false, -- log output
	width = 0.62, -- valeu of cols
	height = 0.38, -- listview height
	preview_height = 0.38,
	preview_lines = 40, -- total lines in preview screen
	preview_lines_before = 5, -- lines before the highlight line
	default_mapping = true,
	keymaps = {
		{ key = '<Space>gla', mode = 'n', func = require('navigator.codelens').run_action, desc = 'run code lens action' },
		{ key = "gK", func = vim.lsp.declaration, desc = 'declaration' },
	}, -- e.g keymaps={{key = "GR", func = vim.lsp.buf.references}, } this replace gr default mapping
	external = nil, -- true: enable for goneovim multigrid otherwise false
	border = 'single', -- border style, can be one of 'none', 'single', 'double', "shadow"
	lines_show_prompt = 10, -- when the result list items number more than lines_show_prompt,
	-- fuzzy finder prompt will be shown
	combined_attach = 'both', -- both: use both customized attach and navigator default attach, mine: only use my attach defined in vimrc
	on_attach = function(client, bufnr)
		-- your on_attach will be called at end of navigator on_attach
	end,
	ts_fold = false,
	treesitter_analysis = true, -- treesitter variable context
	treesitter_analysis_max_num = 100, -- how many items to run treesitter analysis
	treesitter_analysis_condense = true, -- short format of function
	transparency = 100, -- 0 ~ 100 blur the main window, 100: fully transparent, 0: opaque,  set to nil to disable it
	lsp_signature_help = true, -- if you would like to hook ray-x/lsp_signature plugin in navigator
	-- setup here. if it is nil, navigator will not init signature help
	signature_help_cfg = { debug = false }, -- if you would like to init ray-x/lsp_signature plugin in navigator, pass in signature help
	lsp = {
		enable = true, -- if disabled make sure add require('navigator.lspclient.mapping').setup() in you on_attach
		code_action = {
			enable = true,
			sign = true,
			sign_priority = 40,
			virtual_text = true,
			virtual_text_icon = true,
		},
		document_highlight = true, -- highlight reference a symbol
		code_lens_action = {
			enable = true,
			sign = true,
			sign_priority = 40,
			virtual_text = true,
			virtual_text_icon = true,
		},
		diagnostic = {
			underline = true,
			virtual_text = { spacing = 3, source = true }, -- show virtual for diagnostic message
			update_in_insert = false, -- update diagnostic message in insert mode
			severity_sort = { reverse = true },
		},
		format_on_save = false, -- set to false to disasble lsp code format on save (if you are using prettier/efm/formater etc)
		format_options = { async = false }, -- async: disable by default, I saw something unexpected
		disable_nulls_codeaction_sign = true, -- do not show nulls codeactions (as it will alway has a valid action)
		disable_format_cap = {}, -- a list of lsp disable file format (e.g. if you using efm or vim-codeformat etc), empty by default
		disable_lsp = {}, -- a list of lsp server disabled for your project, e.g. denols and tsserver you may
		-- only want to enable one lsp server
		disply_diagnostic_qf = false, -- always show quickfix if there are diagnostic errors
		diagnostic_load_files = false, -- lsp diagnostic errors list may contains uri that not opened yet set to true
		-- to load those files
		diagnostic_virtual_text = true, -- show virtual for diagnostic message
		diagnostic_update_in_insert = true, -- update diagnostic message in insert mode
		diagnostic_scrollbar_sign = { '▃', '▆', '█' }, -- set to nil to disable, set to {'╍', 'ﮆ'} to enable diagnostic status in scroll bar area
		tsserver = {
			-- filetypes = {'typescript'} -- disable javascript etc,
			-- set to {} to disable the lspclient for all filetype
		},
		servers = {}, -- you can add additional lsp server so navigator will load the default for you
	},
	lsp_installer = false, -- set to true if you would like use the lsp installed by williamboman/nvim-lsp-installer
	mason = false, -- set to true if you would like use the lsp installed by williamboman/mason
	icons = {
		icons = true, -- set to false to use system default ( if you using a terminal does not have nerd/icon)
		-- Code action
		code_action_icon = " ",
		-- code lens
		code_lens_action_icon = "",
		-- Diagnostics
		diagnostic_head = "",
		diagnostic_err = "",
		diagnostic_warn = "",
		diagnostic_info = "",
		diagnostic_hint = "",

		diagnostic_head_severity_1 = '',
		diagnostic_head_severity_2 = '',
		diagnostic_head_severity_3 = '',
		diagnostic_head_description = '',
		diagnostic_virtual_text = '',
		diagnostic_file = '',
		-- Values
		value_changed = '',
		value_definition = '', -- it is easier to see than 🦕
		side_panel = {
			section_separator = '',
			line_num_left = '',
			line_num_right = '',
			inner_node = '├○',
			outer_node = '╰○',
			bracket_left = '⟪',
			bracket_right = '⟫',
		},
		-- Treesitter
		match_kinds = {
			var = ' ', -- "👹", -- Vampaire
			method = 'ƒ ', --  "🍔", -- mac
			['function'] = ' ', -- "🤣", -- Fun
			parameter = '  ', -- Pi
			associated = '',
			namespace = '',
			type = ' ',
			field = '',
			module = '',
			flag = '',
		},
		treesitter_defult = '',
		doc_symbols = '',
	},
})
