local status, mason = pcall(require, "mason")
if not status then
	print("ERROR: module 'mason' not found")
	return
end

local status, mason_lspconfig = pcall(require, "mason-lspconfig")
if not status then
	print("ERROR: module 'mason' not found")
	return
end

mason.setup()
mason_lspconfig.setup({
	ensure_installed = {
		-- "asm_lsp",
		"bashls",
		"clangd",
		"dockerls",
		"jsonls",
		"sumneko_lua",
		"marksman",
		"pyright",
		"yamlls",
	},
	automatic_installation = false,
})
