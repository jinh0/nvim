(import-macros {: set!} :config.macros)

;; GUI Necessities
(set! termguicolors) ; Use GUI colors
(set! showmode false) ; Disables bottom-left mode status '--INSERT--'
(set! lazyredraw) ; Speed up macros
(set! re 0) ;; New regular expression method
(set! shortmess "filnxtToOFI") ;; I is for skipping :intro

(set! background :dark)
(set! number)
(set! cursorline)
(set! cmdheight 1)
(set! scrolloff 8)
(set! wrap)
(set! textwidth 80)

(set! splitbelow)
(set! splitright)

;; Search
; (set! hlsearch) what does this do?
(set! hlsearch false)
(set! incsearch)

(set! ignorecase)
(set! smartcase)

;; Folds
(set! foldmethod :indent)
(set! foldlevelstart 30)
(set! conceallevel 2)

;; Tabs
(set! tabstop 2)
(set! shiftwidth 2)
(set! smarttab)
(set! expandtab) ; always use spaces instead of tabs

;; Auto update files if they are edited outside of Vim
(set! autoread)
(set! autowrite)

(set! signcolumn :yes)

;; nvim-cmp
(set! completeopt "menu,menuone,noselect")

