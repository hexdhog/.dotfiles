local status, _ = pcall(require, "lspconfig")
if not status then
	print("ERROR: module 'lspconfig' not found")
	return
end

require("mason").setup()
require("mason-lspconfig").setup()
require("default.lsp.handlers").setup()
