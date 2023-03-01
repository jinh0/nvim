(import-macros {: map!} :config.macros)

;; Buffer traversal
(map! n <C-h> <C-w>h)
(map! n <C-j> <C-w>j)
(map! n <C-k> <C-w>k)
(map! n <C-l> <C-w>l)

(map! n <A-1> ":BufferGoto 1<CR>")
(map! n <A-2> ":BufferGoto 2<CR>")
(map! n <A-3> ":BufferGoto 3<CR>")
(map! n <A-4> ":BufferGoto 4<CR>")
(map! n <A-5> ":BufferGoto 5<CR>")
(map! n <A-6> ":BufferGoto 6<CR>")
(map! n <A-7> ":BufferGoto 7<CR>")
(map! n <A-8> ":BufferGoto 8<CR>")
(map! n <A-9> ":BufferGoto 9<CR>")
(map! n <A-0> ":BufferLast<CR>")

(map! n "<A-,>" ":BufferPrevious<CR>")
(map! n H ":BufferPrevious<CR>")
(map! n "<A-.>" ":BufferNext<CR>")
(map! n L ":BufferNext<CR>")

(map! n <A-<> ":BufferMovePrevious<CR>")
(map! n <A-H> ":BufferMovePrevious<CR>")
(map! n <A->> ":BufferMoveNext<CR>")
(map! n <A-L> ":BufferMoveNext<CR>")

(map! n <A-w> ":BufferClose<CR>")

;; Resize buffers
(map! n - <C-w>3<)
(map! n = <C-w>3>)

;; Buffer commands
(map! n <A-q> ":q<CR>")
(map! n <A-s> ":w<CR>")

;; Terminal mappings
(map! t <Esc> <C-\><C-n>)
(map! t <C-h> <Esc><C-w>h)
(map! t <C-j> <Esc><C-w>j)
(map! t <C-k> <Esc><C-w>k)
(map! t <C-l> <Esc><C-w>l)

;; Helpful mappings
(map! n < <<)
(map! n > >>) 

(map! n <space><space> za) ; toggle folds
(map! v <A-c> "\"+y") ; copy to clipboard

(map! n <C-x> ":TSHighlightCapturesUnderCursor<CR>")

(map! n ++ "<Plug>(comment_toggle_linewise_current)")
(map! v ++ "<Plug>(comment_toggle_linewise_visual)")

(map! n <C-t> ":NvimTreeToggle<CR>")

;; Move to Telescope config
(map! n <C-p> ":Telescope find_files<cr>")
(map! n <A-c> ":Telescope colorscheme<cr>")
(map! n <A-p> ":Telescope projects<cr>")
(map! n gr ":Telescope lsp_references<cr>")
(map! n <leader>gg ":Telescope live_grep<cr>")
(map! n <leader>tt ":Telescope diagnostics<cr>")
(map! n <leader>ss ":Telescope lsp_dynamic_workspace_symbols<cr>")
