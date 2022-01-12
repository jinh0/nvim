require'nvim-treesitter.configs'.setup {
  ensure_installed = { "javascript", "graphql", "json", "c", "cpp" }, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true -- false will disable the whole extension
    -- disable = { 'typescript', 'tsx'}
  },
  indent = {
    enable = false
  },
  context_commentstring = {
    enable = true
  }
}
