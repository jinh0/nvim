(import-macros {: let!} :fnl.config.macros)

;; lazy.nvim requires this to be set before it is called
(let! mapleader " ")
(let! maplocalleader ",")

;; Bootstrap lazy.nvim
(let [lazypath (.. (vim.fn.stdpath "data") "/lazy/lazy.nvim")]
  (if (not (vim.loop.fs_stat lazypath))
      (vim.fn.system ["git"
                      "clone"
                      "--filter=blob:none"
                      "https://github.com/folke/lazy.nvim.git"
                      "--branch=stable"
                      lazypath]))
  (vim.opt.rtp:prepend lazypath))

;; Call lazy.nvim
(let [{: setup} (require "lazy")]
  (setup "plugins" {:dev {:path "~/dev"}}))
