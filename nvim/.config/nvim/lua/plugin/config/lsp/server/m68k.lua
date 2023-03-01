return {
	on_attach = function()
		print("attached to m68k file!")
		vim.g.asmsyntax = "asm68k"
	end,
	filetypes = { "asm68k", "x68", "X68" },
	init_options = {
		format = {
			align = {
				mnemonic = 12,
				operands = 22,
				comment = 48,
				operator = 0,
				value = 0,
				standAloneComment = "nearest",
				indentStyle = "space",
				tabSize = 8,
				autoExtend = "line"
			}
		}
	}
}
