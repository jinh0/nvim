local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
  vim.keymap.set('n', '<space>d', vim.diagnostic.open_float, {buffer = bufnr})
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, {buffer = bufnr})
end)

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
require'lspconfig'.ocamllsp.setup{
  on_attach=require'virtualtypes'.on_attach
}

lsp.setup()

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

cmp.setup({
  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<M-Space>'] = cmp.mapping.complete(),
  }
})
