local M = {}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local map = vim.keymap.set
local opts = { noremap = true, silent = true }
map('n', '<space>e', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

	-- Mappings.
	-- See `:help vim.lsp.*` for documentation on any of the below functions
	local bufopts = { noremap=true, silent=true, buffer=bufnr }
	map('n', 'gD', vim.lsp.buf.declaration, bufopts)
	map('n', 'gd', vim.lsp.buf.definition, bufopts)
	map('n', 'K', vim.lsp.buf.hover, bufopts)
	map('n', 'gi', vim.lsp.buf.implementation, bufopts)
	map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
	map('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
	map('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
	map('n', '<space>wl', function()
		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
	end, bufopts)
	map('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
	map('n', '<space>rn', vim.lsp.buf.rename, bufopts)
	map('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
	map('n', 'gr', vim.lsp.buf.references, bufopts)
	map('n', '<space>f', vim.lsp.buf.formatting, bufopts)

	require("plugin.lsp_signature").on_attach(client, bufnr)
end

local status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status then
	print("ERROR: module 'cmp_nvim_lsp' not found")
	return
end

local capabilities = cmp_nvim_lsp.default_capabilities(vim.lsp.protocol.make_client_capabilities())

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

M.setup = function (lspconfig, server)
	local server_config = require("lsp.config." .. server)
	server_config["on_attach"] = on_attach
	server_config["flags"] = lsp_flags
	server_config["capabilities"] = capabilities
	lspconfig[server].setup(server_config)
end

return M
