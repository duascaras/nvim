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

lsp.preset('recommended')
lsp.setup()
