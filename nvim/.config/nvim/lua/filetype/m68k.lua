vim.g.asmsyntax = "asm68k"
vim.filetype.add({
	extension = {
		m68k = "asm68k",
		X68 = "asm68k",
		x68 = "asm68k",
	}
})
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "asm68k" },
  callback = function()
    vim.bo.commentstring = ";%s"
	vim.bo.textwidth = 80
  end,
})
