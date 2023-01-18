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

-- bootstrap hotpot.nvim
local hotpot_path = vim.fn.stdpath('data') .. '/lazy/hotpot.nvim'
if vim.fn.empty(vim.fn.glob(hotpot_path)) > 0 then
  print("Could not find hotpot.nvim, cloning new copy to", hotpot_path)
  vim.fn.system({'git', 'clone',
                 'https://github.com/rktjmp/hotpot.nvim', hotpot_path})
  vim.cmd("helptags " .. hotpot_path .. "/doc")
end

vim.opt.rtp:prepend(hotpot_path)

-- Enable fnl/ support
--require("hotpot").setup({
--  enable_hotpot_diagnostics = true,
--  compiler = {
--    macros = {
--      env = "_COMPILER",
--      compilerEnv = _G,
--      allowedGlobals = false,
--    }
--  }
--})

vim.g.mapleader = " "
vim.g.maplocalleader = ","

--require "hotpot"

require("lazy").setup("plugins", {
  dev = {
    path = "~/dev"
  }
})

-- require 'impatient'

require 'mason'.setup()
require 'mason-lspconfig'.setup()
require 'plugins.lsp.lsp-config'

require 'config.startup'
require 'config.opts'
require 'config.globals'
require 'config.autocmds'
require 'config.theme'
require 'config.mappings'

vim.cmd([[
  imap <silent><expr> <Space> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Space>'
]])
