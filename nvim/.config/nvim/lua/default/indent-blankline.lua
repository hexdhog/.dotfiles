vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:¬")

local status, indent_blankline = pcall(require, "indent_blankline")
if not status then
	print("ERROR: module 'indent_blankline' not found")
	return
end

indent_blankline.setup {
	show_end_of_line = true,
	space_char_blankline = " ",
}
