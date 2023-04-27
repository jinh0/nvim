(import-macros {: let!} :fnl.config.macros)

(let! mapleader " ")
(let! maplocalleader ",")

;; https://github.com/neovim/neovim/issues/2437
; (let! loaded_python_provider 1)
; (let! loaded_python3_provider 1)

(let! gruvbox_material_background "hard")
(let! gruvbox_material_better_performance 1)

;; TODO: move this with blamer
(let! blamer_enabled 1)

;; TODO: move these to vimtex settings
;; LaTeX stuff
(let! tex_conceal "abdgms")
(let! tex_flavor "latex")

(let! vimtex_view_method "skim")
(let! vimtex_compiler_latexmk {:options ["-shell-escape"]})
(let! vimtex_quickfix_ignore_filters ["Marginpar on page" "Overfull" "Underfull"])

(let! coqtail_nomap 1)

;; NERDCommenter
(let! NERDCreateDefaultMappings 1)
(let! NERDSpaceDelims 1)

;; Emmet
(let! user_emmet_leader_key ",")
(let! tagalong_additional_filetypes ["html" "xml" "jsx" "js" "javascript" "javascriptreact" "ejs" "htmldjango"])
