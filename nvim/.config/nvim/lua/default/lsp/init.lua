local status, lspconfig = pcall(require, "lspconfig")
if not status then
	print("ERROR: module 'lspconfig' not found")
	return
end

require("mason").setup()
require("mason-lspconfig").setup()
require("default.lsp.handlers").setup()

lspconfig.clangd.setup {
	cmd = {
		"clangd",
		"--all-scopes-completion",
		"--suggest-missing-includes",
		"--background-index",
		"--pch-storage=disk",
		"--cross-file-rename",
		"--log=info",
		"--completion-style=detailed",
		"--enable-config", -- clangd 11+ supports reading from .clangd configuration file
		"--clang-tidy",
		"--offset-encoding=utf-16", --temporary fix for null-ls
		-- "--clang-tidy-checks=-*,llvm-*,clang-analyzer-*,modernize-*,-modernize-use-trailing-return-type",
		-- "--fallback-style=Google",
		-- "--header-insertion=never",
		-- "--query-driver=<list-of-white-listed-complers>"
	},
	filetypes = {"c", "cpp", "objc", "objcpp"},
}
