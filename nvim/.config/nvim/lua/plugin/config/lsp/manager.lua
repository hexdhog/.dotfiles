local M = {}

local on_attach = function(client, bufnr)
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

	local bufopts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
	vim.keymap.set("n", "<C-K>", vim.lsp.buf.signature_help, bufopts)
	-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, opts)
	-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
	vim.keymap.set("n", "<leader>df", vim.diagnostic.open_float, bufopts)
	vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, bufopts)
	vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, bufopts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
	vim.keymap.set("n", "<leader>FF", function() vim.lsp.buf.format({ async = true }) end, bufopts)

	require("plugin.config.lsp-signature").on_attach(client, bufnr)
end

local signs = { Error = "█ ", Warn = "█ ", Hint = "█ ", Info = "█ " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
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

local handlers = {
	["textDocument/publishDiagnostics"] = vim.lsp.with(
		vim.lsp.diagnostic.on_publish_diagnostics,
		{
			update_in_insert = true,
			severity_sort = true
		}
	)
}

M.setup = function(lspconfig, server)
	local config = require("plugin.config.lsp.server." .. server)
	local on_pre_attach = config["on_attach"]

	if (on_pre_attach == nil) then
		config["on_attach"] = on_attach
	else
		config["on_attach"] = function(client, bufrn)
			on_pre_attach(client, bufrn)
			on_attach(client, bufrn)
		end
	end

	config["flags"] = lsp_flags
	config["capabilities"] = capabilities
	config["handlers"] = handlers

	lspconfig[server].setup(config)
end

return M
