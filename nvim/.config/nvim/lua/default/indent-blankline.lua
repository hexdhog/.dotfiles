vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:¬")

local ok, indent_blankline = pcall("indent_blankline")
if not ok then
	return
end

indent_blankline.setup {
	show_end_of_line = true,
	space_char_blankline = " ",
}
