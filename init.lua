require 'impatient'
require 'hotpot'

require 'plugins'

require 'options'

require 'config.autocmds'
require 'config.theme'

require('mason').setup()
require('mason-lspconfig').setup()
require 'plugins.lsp-config'

vim.cmd('let maplocalleader=","')

require 'theme'
require 'mappings'
require 'plugins.extras'
