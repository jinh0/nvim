return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    'PaterJason/cmp-conjure',
    'saadparwaiz1/cmp_luasnip',
  },
  config = function()
    local cmp = require'cmp'
    local luasnip = require 'luasnip'

    local has_words_before = function()
      local line, col = unpack(vim.api.nvim_win_get_cursor(0))
      return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
    end

    -- Global setup.
    cmp.setup({
      snippet = {
        expand = function(args)
          -- -- vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
          -- -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        end,
      },
      -- window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
      -- },
      window = {
        completion = {
          winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
          col_offset = -3,
          side_padding = 0,
        },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
          local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
          local strings = vim.split(kind.kind, "%s", { trimempty = true })
          kind.kind = " " .. (strings[1] or "") .. " "
          kind.menu = "    (" .. (strings[2] or "") .. ")"

          return kind
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<M-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
        ["<C-j"] = cmp.mapping(function(fallback)
          local copilot_keys = vim.fn['copilot#Accept']()

          if copilot_keys ~= '' and type(copilot_keys) == 'string' then
            vim.api.nvim_feedkeys(copilot_keys, 'i', true)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<Tab>"] = cmp.mapping(function(fallback)
          local copilot_keys = vim.fn['copilot#Accept']()

          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif copilot_keys ~= '' and type(copilot_keys) == 'string' then
            vim.notify(copilot_keys)
            vim.api.nvim_feedkeys(copilot_keys, 'i', true)
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      sources = {
        { name = 'nvim_lsp' },
        { name = "nvim_lua" },
        { name = "vsnip" },
        { name = "path" },
        { name = "buffer" },
        { name = "nvim_lsp_signature_help" },
        { name = 'luasnip' },
        { name = 'conjure' },
      },
    })
  end
}
