(macro colorscheme! [scheme]
  '(vim.cmd.colorscheme ,(tostring scheme)))

(local hl! (partial vim.api.nvim_set_hl 0))

;; Set colorscheme
(colorscheme! tokyonight)

;; Color brackets as comment color
(hl! "@punctuation.bracket" {:link "Comment"})
