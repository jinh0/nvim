require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = 'auto',
    -- component_separators = { left = '', right = ''},
    -- section_separators = { left = '', right = ''},
    -- component_separators = '|',
    -- section_separators = { left = '', right = '' },
    -- disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
    },
    lualine_c = {
      {
        'filename',
        color = { gui = 'bold' }
      },
      function ()
        -- if #vim.lsp.buf_get_clients() > 0 then
          -- -- vim.notify(vim.inspect(require'lsp-status'.capabilities))

          -- -- if require'lsp-status'.capabilities.textDocument.documentSymbol == nil then
            -- -- return ''
          -- -- end

          -- -- require'lsp-status'.update_current_function()
          -- -- return vim.api.nvim_eval('b:lsp_current_function')
        -- end

        return ''
      end,
      'diagnostics',
    },
    lualine_x = {'branch', 'diff'},
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
