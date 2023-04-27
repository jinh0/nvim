(fn str->list [str]
  (let [tbl {}]
    (for [i 1 (# str)]
      (table.insert tbl (str:sub i i)))
    tbl))

;; MACROS

(fn let! [key val]
  '(tset vim.g ,(tostring key) ,val))

(fn set! [key val]
  (if (= val nil)
      '(tset vim.opt ,(tostring key) true)
      '(tset vim.opt ,(tostring key) ,val)))

(fn autocmd! [event file opts]
  (let [event (if (sym? event) (tostring event) event)
        file (if (sym? file) (tostring file) file)
        opts (if (sym? opts) {:command (tostring opts)} {:callback opts})]
    (do (tset opts "pattern" file)
        '(vim.api.nvim_create_autocmd ,event ,opts))))

(fn map! [mode keymap cmd]
  (let [mode (if (sym? mode) (tostring mode) mode)
        keymap (if (sym? keymap) (tostring keymap) keymap)
        cmd (if (sym? cmd) (tostring cmd) cmd)
        opts {:silent true
              :noremap true}]
    '(vim.keymap.set ,(str->list (tostring mode)) ,keymap ,cmd ,opts)))

(fn colorscheme! [scheme]
  '(vim.cmd.colorscheme ,(tostring scheme)))

{: let!
 : set!
 : autocmd!
 : map!
 : colorscheme!}
