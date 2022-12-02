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

local capabilities = cmp_lsp.default_capabilities()

-- TODO: setup this properly
lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = function()
		vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
		-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
		-- vim.keymap.set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
		-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, { buffer = 0 })
		vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
		vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
		vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = 0 })
		vim.keymap.set('n', '<leader>FF', function() vim.lsp.buf.format({ async = true }) end, { buffer = 0 })
	end
})
