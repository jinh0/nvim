-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua require"lspsaga.provider".preview_definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>k', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', 'ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', '<space>d', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua require"lspsaga.diagnostic".lsp_jump_diagnostic_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting_sync(nil, 1500)<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

require 'lspconfig'.texlab.setup {
  on_attach = on_attach
}

require'lspconfig'.sumneko_lua.setup {
    on_attach = on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = {'vim'}
        },
      }
    }
}

require'lspconfig'.ocamllsp.setup {
  init_options = { documentFormatting = false },
  on_attach = function (client, bufnr)
    require'virtualtypes'.on_attach(client, bufnr)
    on_attach(client, bufnr)
  end,
  filetypes = { "ocaml", "ocaml.interface", "reason", "ml" }
}

require'lspconfig'.racket_langserver.setup {
  on_attach = on_attach
}

require'lspconfig'.hls.setup { on_attach = on_attach }

require'lspconfig'.tsserver.setup {
  init_options = {
    documentFormatting = false,
    preferences = {
      codeActionsOnSave = {
        source = {
          addMissingImports = true,
        }
      }
    }
  },
  -- handlers = lsp_status.extensions.clangd.setup(),
  on_attach = function(client, bufnr)
    client.resolved_capabilities.document_formatting = false
    -- lsp_status.on_attach(client)
    on_attach(client, bufnr)
  end,
}

require'lspconfig'.clangd.setup {
  -- handlers = lsp_status.extensions.clangd.setup(),
  on_attach = function (client, bufnr)
    -- lsp_status.on_attach(client)
    on_attach(client, bufnr)
  end
}

local prettier = {
  formatCommand = 'prettierd "${INPUT}"',
  formatStdin = true,
  env = {
    string.format('PRETTIERD_DEFAULT_CONFIG=%s', vim.fn.expand('~/.config/nvim/utils/.prettierrc.json')),
  }
}

local eslint = {
  lintCommand = "eslint_d --stdin --fix-to-stdout --stdin-filename=${INPUT}",
  lintStdin = true,
  lintFormats = {"%f:%l:%c: %m"},
  lintIgnoreExitCode = true,
  formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
  formatStdin = true
}

require'lspconfig'.efm.setup {
  cmd = {'efm-langserver', '-logfile', '/tmp/efm.log', '-loglevel', '5'},
  init_options = { documentFormatting = true },
  settings = {
    -- rootMarkers = {'./git'},
    languages = {
      javascript = { prettier },
      typescript = { prettier },
      javascriptreact = { prettier },
      typescriptreact = { prettier },
      json = { prettier },
    }
  },
  filetypes = { 'json', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'lua' }
}


local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    'documentation',
    'detail',
    'additionalTextEdits',
  }
}

require'lspconfig'.html.setup {
  capabilities = capabilities,
  on_attach = on_attach
}

require'lspconfig'.pyright.setup {
  on_attach = on_attach,
  settings = {
    python = {
      analysis = {
        typeCheckingMode = 'off'
      }
    }
  }
}

require'lspconfig'.jsonls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    json = {
      -- Schemas https://www.schemastore.org
      schemas = {
        {
          fileMatch = {"package.json"},
          url = "https://json.schemastore.org/package.json"
        },
        {
          fileMatch = {"tsconfig.json"},
          url = "https://json.schemastore.org/tsconfig.json"
        },
        {
          fileMatch = {"jsconfig.json"},
          url = "https://json.schemastore.org/jsconfig.json"
        },
        {
          fileMatch = {
            ".prettierrc",
            ".prettierrc.json",
            "prettier.config.json"
          },
          url = "https://json.schemastore.org/prettierrc.json"
        },
        {
          fileMatch = {".eslintrc", ".eslintrc.json"},
          url = "https://json.schemastore.org/eslintrc.json"
       },
        {
          fileMatch = {".babelrc", ".babelrc.json", "babel.config.json"},
          url = "https://json.schemastore.org/babelrc.json"
        },
        {
          fileMatch = {"lerna.json"},
          url = "https://json.schemastore.org/lerna.json"
        },
        {
          fileMatch = {"now.json", "vercel.json"},
          url = "https://json.schemastore.org/now.json"
        },
        {
          fileMatch = {
            ".stylelintrc",
            ".stylelintrc.json",
            "stylelint.config.json"
          },
          url = "http://json.schemastore.org/stylelintrc.json"
        }
      }
    }
  }
}

require'lspconfig'.tailwindcss.setup {
  on_attach = on_attach,
  filetypes = { 'typescriptreact', 'html', 'javascriptreact' }
}

require'lspconfig'['rust_analyzer'].setup {
  on_attach = on_attach,
}

require'lspconfig'.svelte.setup {
  on_attach = function(client, bufnr)
    on_attach(client, bufnr)
  end,
}


require'lspconfig'.tsserver.setup {
  init_options = { documentFormatting = false },
  on_attach = function(client, bufnr)
    client.server_capabilities.document_formatting = false
    on_attach(client, bufnr)
  end,
}

vim.cmd([[ autocmd BufWritePre *.js lua vim.lsp.buf.format({ timeout_ms = 1000, async = false, filter = function (client) return client.name ~= "tsserver" end }) ]])
vim.cmd([[ autocmd BufWritePre *.json lua vim.lsp.buf.format({ timeout_ms = 1000, async = false, filter = function (client) return client.name ~= "tsserver" end }) ]])
vim.cmd([[ autocmd BufWritePre *.jsx lua vim.lsp.buf.format({ timeout_ms = 1000, async = false, filter = function (client) return client.name ~= "tsserver" end }) ]])
vim.cmd([[ autocmd BufWritePre *.ts lua vim.lsp.buf.format({ timeout_ms = 1000, async = false, filter = function (client) return client.name ~= "tsserver" end }) ]])
vim.cmd([[ autocmd BufWritePre *.tsx lua vim.lsp.buf.format({ timeout_ms = 1000, async = false, filter = function (client) return client.name ~= "tsserver" end }) ]])
vim.cmd([[ autocmd BufWritePre *.svelte lua vim.lsp.buf.format({ timeout_ms = 100 }) ]])
