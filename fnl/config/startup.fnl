(local disabled_built_ins
       ["2html_plugin"
        "getscript"
        "getscriptPlugin"
        "gzip"
        "logipat"
        "netrw"
        "netrwPlugin"
        "netrwSettings"
        "netrwFileHandlers"
        "matchit"
        "tar"
        "tarPlugin"
        "rrhelper"
        "spellfile_plugin"
        "vimball"
        "vimballPlugin"
        "zip"
        "zipPlugin"])

(each [_ plugin (ipairs disabled_built_ins)] 
  (tset vim.g (.. "loaded_" plugin) 1))
