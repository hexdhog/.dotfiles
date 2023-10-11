vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:¬")

local status, ibl = pcall(require, "ibl")
if not status then
	print("ERROR: module \"ibl\" not found")
	return
end

-- TODO: review ibl v3 for new configuration
ibl.setup({
	debounce = 100,
	indent = { char = "▎" },
	whitespace = { highlight = { "Whitespace", "NonText" } },
	scope = { exclude = { language = { "lua" } }},
	viewport_buffer = {
		min = 30,
		max = 500
	}
})
