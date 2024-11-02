vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- Buffer local mappings.
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<space>d", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<space>f", function()
			vim.lsp.buf.format({ async = true })
		end, opts)
	end,
})

require("lspconfig").lua_ls.setup({
  on_init = function(client)
    -- local path = client.workspace_folders[1].name
    -- if vim.loop.fs_stat(path..'/.luarc.json') or vim.loop.fs_stat(path..'/.luarc.jsonc') then
    --   return
    -- end

    client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
      runtime = {
        -- Tell the language server which version of Lua you're using
        -- (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT'
      },
      -- Make the server aware of Neovim runtime files
      workspace = {
        checkThirdParty = false,
        library = {
          vim.env.VIMRUNTIME,
          -- Depending on the usage, you might want to add additional paths here.
          -- "${3rd}/luv/library"
          -- "${3rd}/busted/library",
          vim.fn.stdpath("data") .. "/lazy"
        }
        -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
        -- library = vim.api.nvim_get_runtime_file("", true)
      }
    })
  end,
	settings = {
		Lua = {
			diagnostics = {
				disable = { "duplicate-set-field" },
			},
		},
	},
})
require("lspconfig").ocamllsp.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").texlab.setup({})
require("lspconfig").clangd.setup({
	cmd = { "clangd" },
	filetypes = {
		"c",
		"cpp",
		"objc",
		"objcpp",
		"cuda",
		"proto",
	},
})
require("lspconfig").hls.setup({
	cmd = { "haskell-language-server-wrapper", "--lsp" },
	-- on_attach = require'virtualtypes'.on_attach
})

local nvim_lsp = require('lspconfig')

nvim_lsp.denols.setup {
  root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
}

require("lspconfig").tsserver.setup({
  root_dir = nvim_lsp.util.root_pattern("package.json"),
  single_file_support = false
})
require("lspconfig").svelte.setup({})

require("lspconfig").tailwindcss.setup({})

require("lspconfig").fennel_ls.setup({
  root_dir = function(filename, _)
    return vim.fs.root(filename, { ".git", "fnl", ".nfnl.fnl" })
  end,
  settings = {
    ["fennel-ls"] = {
      ["extra-globals"] = "vim"
    }
  }
})

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require('lspconfig').jsonls.setup {
  capabilities = capabilities,
  settings = {
    json = {
      schemas = require('schemastore').json.schemas({
        -- select = {
        --   'tsconfig.json',
        --   'package.json',
        -- },
      }),
      validate = { enable = true },
    },
  },
}

require'lspconfig'.jdtls.setup{}
