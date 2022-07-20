local map = vim.api.nvim_set_keymap

local opt = { silent = true, noremap = true }

local M = {}

-- Buffer navigation
map('n', '<C-h>', '<C-w>h', opt)
map('n', '<C-j>', '<C-w>j', opt)
map('n', '<C-k>', '<C-w>k', opt)
map('n', '<C-l>', '<C-w>l', opt)

map('n', '--', '<C-w>3<', opt)
map('n', '==', '<C-w>3>', opt)

-- Terminal mappings
map('t', '<Esc>', '<C-\\><C-n>', opt)
map('t', '<C-h>', '<Esc><C-w>h', opt)
map('t', '<C-j>', '<Esc><C-w>j', opt)
map('t', '<C-k>', '<Esc><C-w>k', opt)
map('t', '<C-l>', '<Esc><C-w>l', opt)

-- Close buffers
map('n', '<A-q>', ':q<CR>', opt)
map('n', '<A-s>', ':w<CR>', opt)

map('n', '<C-x>', ':TSHighlightCapturesUnderCursor<CR>', opt)

-- Extra goods
map('n', '<space><space>', 'za', opt)  -- open fold
-- map('n', '<C-s>', '<C-^>', opt)        -- jump between (swap)
-- map('n', '<leader>ss', ':source %<cr>', opt)        -- jump between (swap)
map('v', '<A-c>', '"+y', opt)
map('n', '<', '<<', opt)
map('n', '>', '>>', opt)

-- map('v', 'J', ":m '>+1<CR>gv=gv", opt) -- select and move lines
-- map('v', 'K', ":m '<-2<CR>gv=gv", opt) -- select and move lines

-- User commands
vim.cmd([[
  command! Config e ~/.config/nvim/init.lua
]])

-- NERDCommenter
map('v', '++', '<plug>NERDCommenterToggle', { noremap = false })
map('n', '++', '<plug>NERDCommenterToggle', { noremap = false })

-- NvimTree
map('n', '<C-t>', ':NvimTreeToggle<CR>', opt)

-- map('n', '<C-t>', ':TreeToggle<CR>', opt)

M.telescope = function()
  map('n', '<C-p>', ':Telescope find_files<cr>', opt)
  map('n', '<A-c>', ':Telescope colorscheme<cr>', opt)
  map('n', 'gr', ':Telescope lsp_references<cr>', opt)
  map('n', '<leader>gg', ':Telescope live_grep<cr>', opt)
  map('n', '<leader>tt', ':Telescope diagnostics<cr>', opt)
  map('n', '<leader>ss', ':Telescope lsp_dynamic_workspace_symbols<cr>', opt)
  map('n', '<leader>cp', ':Telescope neoclip<cr>', opt)
  -- map('n', '<leader>ds', ':Telescope coc document_symbols<cr>', opt)

  map('n', '<A-p>', ':lua require("telescope.builtin").buffers()<cr>', opt)
  map('n', '<leader>pp', ':lua require("plugins.telescope").search_dotfiles()<cr>', opt)
end

M.tsunit = function()
  map('n', 'dx', ':lua require"treesitter-unit".delete()<CR>', opt)
  map('x', 'iu', ':lua require"treesitter-unit".select()<CR>', opt)
  map('x', 'au', ':lua require"treesitter-unit".select(true)<CR>', opt)
  map('o', 'iu', ':<c-u>lua require"treesitter-unit".select()<CR>', opt)
  map('o', 'au', ':<c-u>lua require"treesitter-unit".select(true)<CR>', opt)
end

M.symbols_outline = function()
  map('n', '<C-y>', ':SymbolsOutline<CR>', opt)
end

M.toggleterm = function()
  -- map('n', '<C-_>', ':ToggleTerm<CR>', opt)
  -- map('t', '<C-_>', '<esc>:ToggleTerm<CR>', opt)
end

map('n', '<A-,>', ':BufferPrevious<CR>', opt)
map('n', '<A-.>', ':BufferNext<CR>', opt)
-- Re-order to previous/next
map('n', '<A-<>', ':BufferMovePrevious<CR>', opt)
map('n', '<A->>', ' :BufferMoveNext<CR>', opt)
-- Goto buffer in position...
map('n', '<A-1>', ':BufferGoto 1<CR>', opt)
map('n', '<A-2>', ':BufferGoto 2<CR>', opt)
map('n', '<A-3>', ':BufferGoto 3<CR>', opt)
map('n', '<A-4>', ':BufferGoto 4<CR>', opt)
map('n', '<A-5>', ':BufferGoto 5<CR>', opt)
map('n', '<A-6>', ':BufferGoto 6<CR>', opt)
map('n', '<A-7>', ':BufferGoto 7<CR>', opt)
map('n', '<A-8>', ':BufferGoto 8<CR>', opt)
map('n', '<A-9>', ':BufferGoto 9<CR>', opt)
map('n', '<A-0>', ':BufferLast<CR>', opt)
-- Close buffer
map('n', '<A-w>', ':BufferClose<CR>', opt)

-- map('n', '<C-c>', ':!g++ -std=c++17 % -Wall -g -o %.out && %.out<CR>', opt)

map('n', 'dw', 'daw', opt)
map('n', 'dW', 'daW', opt)

-- vim.cmd([[
-- nnoremap <C-o> gg/freopen<Enter><C-v>jj<s-i>//<Esc>:w<Enter>:noh<Enter>
-- nnoremap <C-i> gg/freopen<Enter>h<C-v>hjjd:w<Enter>:noh<Enter>
-- ]])

return M
