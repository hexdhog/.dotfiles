local status, lspconfig = pcall(require, "lspconfig")
if not status then
	print("ERROR: module \"lspconfig\" not found")
	return
end

-- if not lspconfig.configs["eslint"] then
-- 	lspconfig.configs["eslint"] = {
-- 		default_config = {
-- 			cmd = { "eslint-lsp" }, -- Assumed executable from mason's eslint-lsp package
-- 			filetypes = { "javascript", "javascriptreact", "vue", "svelte", "astro", "tsx", "ts", "jsx", "js" },
-- 			root_dir = lspconfig.util.root_pattern("package.json", ".eslintrc*", "tsconfig.json"),
-- 			-- Additional settings can be added here, such as settings for Eslint rules
-- 		}
-- 	}
-- end

local lspmanager = require("plugin.config.lsp.manager")

-- TODO: delete debug enable
vim.lsp.set_log_level('debug')

lspmanager.setup(lspconfig, "efm")
lspmanager.setup(lspconfig, "lua_ls")
lspmanager.setup(lspconfig, "jedi_language_server")
lspmanager.setup(lspconfig, "clangd")
lspmanager.setup(lspconfig, "m68k")
lspmanager.setup(lspconfig, "html")
lspmanager.setup(lspconfig, "cssls")
lspmanager.setup(lspconfig, "ts_ls")
