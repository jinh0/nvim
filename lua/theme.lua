local g = vim.g
g.gruvbox_material_background = 'medium'
g.gruvbox_material_better_performance = 1
g.tokyonight_style = 'night'
g.spaceduck_italic = 1
g.rose_pine_variant = 'moon'

vim.cmd('colorscheme nord')

vim.cmd([[ highlight! link TSPunctBracket TSComment ]])
vim.cmd([[ highlight! link TSPunctSpecial TSOperator ]])
vim.cmd([[ highlight! link TSPunctDelimiter TSComment ]])
vim.cmd([[ highlight! TSKeyword guifg=#81A1C1 gui=bold]])
vim.cmd([[ highlight! TSType guifg=#8FBCBB ]])
vim.cmd([[ highlight! TSTypeBuiltin guifg=#8FBCBB ]])
vim.cmd([[ highlight! TSTypeBuiltin guifg=#8FBCBB ]])
vim.cmd([[ highlight! TSConstant guifg=#B48EAD ]])
-- vim.cmd([[ highlight! TSVariableBuiltin guifg=#B48EAD ]])
vim.cmd([[ highlight! Hlargs guifg=#ECEFF4 ]])

vim.cmd([[ highlight! link CmpItemKindFunction TSFunction ]])
vim.cmd([[ highlight! link CmpItemKindMethod TSMethod ]])
vim.cmd([[ highlight! CmpItemAbbrMatch guifg=#88C0D0 ]])
vim.cmd([[ highlight! CmpItemAbbrMatchFuzzy guifg=#88C0D0 ]])
