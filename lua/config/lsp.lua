require('lspconfig').lua_ls.setup ()
require'lspconfig'.ocamllsp.setup{
  on_attach=require'virtualtypes'.on_attach
}

require 'lspconfig'.hls.setup {
  cmd = { "haskell-language-server-wrapper", "--lsp" }
}
