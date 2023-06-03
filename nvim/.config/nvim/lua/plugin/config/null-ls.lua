local status, null_ls = pcall(require, "null-ls")
if not status then
	print("ERROR: module \"null-ls\" not found")
	return
end

local diagnostics = null_ls.builtins.diagnostics
local formatting = null_ls.builtins.formatting

null_ls.setup({
	sources = {
		diagnostics.flake8,
		diagnostics.mypy,
		formatting.black,
	}
})
