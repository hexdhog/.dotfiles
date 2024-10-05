local status, lspconfig = pcall(require, "lspconfig")
if not status then
	print("ERROR: module \"lspconfig\" not found")
	return
end

local lspmanager = require("plugin.config.lsp.manager")
lspmanager.setup(lspconfig, "efm")
lspmanager.setup(lspconfig, "lua_ls")
lspmanager.setup(lspconfig, "jedi_language_server")
lspmanager.setup(lspconfig, "clangd")
lspmanager.setup(lspconfig, "m68k")
