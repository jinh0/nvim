require('nvim-autopairs').setup{}

local Rule = require('nvim-autopairs.rule')
local npairs = require('nvim-autopairs')

npairs.add_rule(Rule("$","$","tex"))
npairs.add_rule(Rule("\\[","\\]","tex"))
npairs.add_rule(Rule('"""', '"""',"python"))
npairs.add_rule(Rule("'''", "'''", "python"))

-- require("nvim-autopairs.completion.cmp").setup({
  -- map_cr = true, --  map <CR> on insert mode
  -- map_complete = true, -- it will auto insert `(` after select function or method item
  -- auto_select = false,  -- auto select first item
-- })
