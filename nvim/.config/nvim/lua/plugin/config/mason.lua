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
		"bashls",
		"clangd",
		"dockerls",
		"jsonls",
		"lua_ls",
		"marksman",
		"pyright",
		"yamlls",
	},
	automatic_installation = false,
})
