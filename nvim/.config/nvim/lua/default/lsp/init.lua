local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
end

require("default.lsp.lsp-installer")
require("default.lsp.handlers").setup()
