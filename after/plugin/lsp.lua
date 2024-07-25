local lsp = require('lsp-zero')

require("mason").setup({})

require("mason-lspconfig").setup({
	ensure_installed = {
		'lua_ls',
		'pylsp',
		'gopls',
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	}
})

local cmp = require('cmp')
local cmp_format = lsp.cmp_format()

local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
	['<C-j>'] = cmp.mapping.select_prev_item(cmp_select),
	['<C-k>'] = cmp.mapping.select_next_item(cmp_select),
	['<Tab>'] = cmp.mapping.confirm({ select = true }),
	['<C-Space>'] = cmp.mapping.complete(),
})

cmp_mappings['<S-Tab>'] = nil

cmp.setup({
	formatting = cmp_format,
	mapping = cmp_mappings,
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
	vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
	vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
	vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
	vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
	vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
	vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
	vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
	vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
	vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
	vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
	vim.keymap.set("n", "<C-s>", ":LspZeroFormat<CR><bar>:update<CR>",
		{ buffer = bufnr, remap = true, silent = true })
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true
})
