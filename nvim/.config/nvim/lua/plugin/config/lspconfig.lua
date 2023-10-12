local status, lspconfig = pcall(require, "lspconfig")
if not status then
	print("ERROR: module \"lspconfig\" not found")
	return
end

local lspmanager = require("plugin.config.lsp.manager")
lspmanager.setup(lspconfig, "efm")
lspmanager.setup(lspconfig, "lua_ls")
lspmanager.setup(lspconfig, "pyright")
lspmanager.setup(lspconfig, "clangd")
