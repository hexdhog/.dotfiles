local status, lspconfig = pcall(require, "lspconfig")
if not status then
	print("ERROR: module \"lspconfig\" not found")
	return
end

local status, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
	print("ERROR: module \"cmp_nvim_lsp\" not found")
	return
end

local lspmanager = require("plugin.config.lsp.manager")
lspmanager.setup(lspconfig, "bashls")
lspmanager.setup(lspconfig, "clangd")
lspmanager.setup(lspconfig, "dockerls")
lspmanager.setup(lspconfig, "marksman")
lspmanager.setup(lspconfig, "pyright") -- for some reason nvim is loading 2 pyright clients...
lspmanager.setup(lspconfig, "sumneko_lua")
lspmanager.setup(lspconfig, "yamlls")