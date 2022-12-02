local M = {}

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
	vim.keymap.set("n", "<C-K>", vim.lsp.buf.signature_help, { buffer = 0 })
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
	-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
	vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
	vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
	vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0 })
	vim.keymap.set('n', '<leader>FF', function() vim.lsp.buf.format({ async = true }) end, { buffer = 0 })

	require("plugin.config.lsp-signature").on_attach(client, bufnr)
end

local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
	print("ERROR: module \"cmp_nvim_lsp\" not found")
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
	debounce_text_changes = 150
}

M.setup = function(lspconfig, server)
	local server_config = require("plugin.config.lsp.server." .. server)
	server_config["on_attach"] = on_attach
	server_config["flags"] = lsp_flags
	server_config["capabilities"] = capabilities
	lspconfig[server].setup(server_config)
end

return M
