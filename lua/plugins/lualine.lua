require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    component_separators = {'>', '<'},
    section_separators = {'', ''},
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    -- lualine_c = {'filename', 'b:coc_current_function'},
    lualine_c = {'filename', 'diagnostics'},
    lualine_x = {'diff'},
    lualine_y = {'filetype'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {}
}
-- component_separators = {'╱', '╱'},
-- section_separators = {'', ''},
