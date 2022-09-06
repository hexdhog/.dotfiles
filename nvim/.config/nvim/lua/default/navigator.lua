require "navigator".setup({
	border = "shadow",
	transparency = 15,
	lsp = {
		format_on_save = false
	},
	keymaps = {
		{ key = '<Space>gla', mode = 'n', func = require('navigator.codelens').run_action, desc = 'run code lens action' }
	}
})
