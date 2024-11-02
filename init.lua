vim.o.laststatus = 3

vim.cmd([[
  set colorcolumn=80

  augroup highlight_yank
      autocmd!
      au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=150}
  augroup END

  let g:conjure#filetypes = ["fennel"]

  autocmd BufNewFile,BufRead *.lispy   set filetype=scheme

  nnoremap <C-,> <C-w>2>
  nnoremap <C-.> <C-w>2<

  set background=dark

  " command Setup e main.py | rightb vsp input.txt | rightb sp output.txt | wincmd h
  " nnoremap <C-s> :silent Setup<CR>
]])

vim.cmd([[
  command Setup e main.cpp | rightb vsp input.txt | rightb sp output.txt | wincmd h
  nnoremap <C-s> :silent Setup<CR>
]])

-- Setup lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Auto-install lazy.nvim if not present
if not vim.loop.fs_stat(lazypath) then
	print("Installing lazy.nvim....")
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
	print("Done.")
end

vim.opt.rtp:prepend(lazypath)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.user_emmet_leader_key = ","

require("lazy").setup("plugins", { dev = { path = "~/dev" } })

vim.opt.termguicolors = true
vim.cmd.colorscheme("everforest")

vim.keymap.set({ "n" }, "<C-h>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<C-j>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<C-k>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set({ "n" }, "<C-l>", "<C-w>l", { noremap = true, silent = true })

require("config.opts")
require("config.mappings")
require("config.lsp")

vim.g.user_emmet_leader_key = ","

vim.api.nvim_set_hl(0, "@punctuation.bracket", { link = "Comment" })
vim.api.nvim_set_hl(0, "schemeParentheses", { link = "Comment" })
