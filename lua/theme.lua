local cs = 'tokyonight'

local g = vim.g
g.gruvbox_material_background = 'medium'
g.gruvbox_material_better_performance = 1
g.tokyonight_style = 'night'
g.spaceduck_italic = 1
g.rose_pine_variant = 'moon'

vim.cmd('colorscheme ' .. cs)

-- vim.api.nvim_set_hl(0, 'EyelinerPrimary', { bold = true, underline = true })
-- require('github-theme').setup()
