(fn use! [name config]
  {1 :rktjmp/hotpot.nvim
   :config (fn []
             (let [{: setup} (require name)]
               (setup config)))})

(use! :rktjmp/hotpot.nvim
      {:enable_hotpot_diagnostics true
       :compiler {:macros {:env "_COMPILER"
                           :compilerEnv "_G"
                           :allowedGlobals false}}})
