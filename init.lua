-- bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("lazy").setup("plugins", { dev = { path = "~/dev" } })

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
