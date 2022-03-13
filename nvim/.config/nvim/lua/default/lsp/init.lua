local status, _ = pcall(require, "lspconfig")
if not status then
	print("ERROR: module 'lspconfig' not found")
	return
end

require("default.lsp.lsp-installer")
require("default.lsp.handlers").setup()
