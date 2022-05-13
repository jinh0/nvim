local opt = vim.opt

vim.g.mapleader = ' '

-- https://github.com/neovim/neovim/issues/2437
vim.g.loaded_python_provider = 1
vim.g.loaded_python3_provider = 1
-- vim.g.python_host_skip_check = 1
-- vim.g.python3_host_skip_check = 1

-- vim.g.livepreview_previewer = 'open -a Preview'

vim.g.vimtex_view_method='skim'
vim.g.vimtex_compiler_latexmk = {
  options = {'-shell-escape'}
}

-- Disable built-in plugins {{{
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   vim.g["loaded_" .. plugin] = 1
end
-- }}}

-- disable :intro screen
vim.o.shortmess = vim.o.shortmess .. 'I'

-- GENERAL
opt.background = 'dark'

opt.mouse = 'a'
opt.cursorline = true
opt.number = true
opt.scrolloff = 8          -- Always keep 8 lines above and below cursor
opt.termguicolors = true   -- Use GUI colors
opt.showmode = false       -- Disables bottom-left mode status '--INSERT--'
opt.re = 0                 -- New regular expression method
opt.wrap = false

opt.laststatus = 3

-- opt.foldmethod = 'marker'
opt.cmdheight=1

-- SEARCH
opt.hlsearch = false
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true

-- FOLDS
opt.foldmethod = 'indent'

-- vim.cmd([[
-- " Callback: Fold level <- next line indent
-- function! FoldMethod(lnum)
    -- let l:indent = max([indent(a:lnum+1), indent(a:lnum)])
    -- return l:indent / &shiftwidth
-- endfunction

-- set foldmethod=expr
-- set foldexpr=FoldMethod(v:lnum)
-- ]])

opt.foldlevelstart = 30

-- TABS
opt.tabstop = 2
opt.shiftwidth = 2
opt.smarttab = true
opt.expandtab = true -- always uses spaces instead of tab characters
-- opt.cindent = true

opt.splitbelow = true
opt.splitright = true

-- Auto update files if they are edited
-- outside of Vim
opt.autoread = true
opt.autowrite = true

opt.lazyredraw = true

opt.signcolumn = 'yes'

opt.completeopt = 'menu,menuone,noselect' -- for nvim-compe

opt.fillchars = 'eob: '

opt.textwidth = 80

opt.hlsearch = true

-- opt.updatetime = 300

-- colorcolumn

vim.cmd([[
  au TextYankPost * lua vim.highlight.on_yank {higroup="Visual", timeout=300, on_visual=true}
]])

-- vim.cmd([[
  -- augroup remember_folds
    -- autocmd!
    -- autocmd BufWinLeave * mkview
    -- autocmd BufWinEnter * silent! loadview
  -- augroup END
-- ]])
