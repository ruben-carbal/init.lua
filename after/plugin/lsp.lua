local lsp_zero = require('lsp-zero')
local cmp = require('cmp')

lsp_zero.on_attach(function(client, bufnr)
    lsp_zero.default_keymaps({
        buffer = bufnr,
        preserve_mappings = false
    })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {'lua_ls', 'tsserver', 'eslint'},
    handlers = {
       lsp_zero.default_setup,
    },
})

cmp.setup({
    sources = {
        {name = 'nvim_lsp'},
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
        ['<C-n>'] = cmp.mapping.select_next_item({behavior = 'select'}),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space'] = cmp.mapping.complete(),
    },
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
})


