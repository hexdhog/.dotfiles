local status, mason = pcall(require, "mason")
if not status then
	print("ERROR: module \"mason\" not found")
	return
end

local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
	print("ERROR: module \"mason-lspconfig\" not found")
	return
end

mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		"lua_ls",
		"pyright",
		"efm",
		-- install manually:
		-- mypy
		-- ruff
	},
	automatic_installation = false,
})
