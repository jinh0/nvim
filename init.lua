require 'config.lazy'

require 'config.startup'
require 'config.opts'
require 'config.globals'
require 'config.autocmds'
require 'config.theme'
require 'config.mappings'

vim.cmd([[
  imap <silent><expr> <Space> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Space>'

  " don't automatically start commenting at new line
  autocmd FileType * set formatoptions-=cro
]])

vim.cmd([[
  au BufNewFile,BufRead *.mll set ft=ocamllex
  au BufNewFile,BufRead *.mly set ft=menhir
  au BufNewFile,BufRead *.v set ft=coq
]])
