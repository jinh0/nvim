(import-macros {: set! : autocmd!} :fnl.config.macros)

;; For auto compiling Fennel into Lua code in certain directories
(autocmd! BufWritePost *.fnl (fn [] (vim.cmd "silent !make")))

;; If working on LaTeX, auto hard wrap text at 80
(autocmd! FileType *.tex (fn [] (set! textwidth 80)))

(autocmd! TextYankPost *
          (fn [] (vim.highlight.on_yank {:higroup :Visual :timeout 300 :on_visual true})))
