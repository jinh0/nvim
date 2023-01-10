(local autocmd! vim.api.nvim_create_autocmd)
(local augroup! vim.api.nvim_create_augroup)

(autocmd! "BufWritePost"
          {:group (augroup! "FennelMake" {:clear true})
           :callback (fn [] (vim.cmd "silent !make"))
           :pattern "*.fnl"})


