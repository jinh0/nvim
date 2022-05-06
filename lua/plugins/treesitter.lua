require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "graphql", "json", "c", "cpp" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true -- false will disable the whole extension
    -- disable = { 'typescript', 'tsx'}
  },
  -- incremental_selection = {
    -- enable = true,
    -- keymaps = {
      -- init_selection = "gnn",
      -- node_incremental = "gcr",
      -- scope_incremental = "gcn",
      -- node_decremental = "gcm",
    -- },
  -- },
  -- indent = {
    -- enable = false
  -- },
  -- context_commentstring = {
    -- enable = true
  -- }
}
