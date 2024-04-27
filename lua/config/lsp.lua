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

require("lspconfig").tsserver.setup({})
require("lspconfig").svelte.setup({})
