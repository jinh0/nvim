local g = vim.g

-- NERDCommenter
g.NERDCreateDefaultMappings = 1
g.NERDSpaceDelims = 1

-- Emmet
g.user_emmet_leader_key = ','
g.tagalong_additional_filetypes = {"html", "xml", "jsx", "js", "javascript", "javascriptreact", "eruby", "ejs", "eco", "php", "htmldjango"}

-- ToggleTerm
require('toggleterm').setup { open_mapping = [[<c-_>]] }
