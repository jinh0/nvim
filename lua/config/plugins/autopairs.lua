local _local_1_ = require("nvim-autopairs")
local setup = _local_1_["setup"]
local add_rule = _local_1_["add_rule"]
local Rule = require("nvim-autopairs.rule")
setup()
add_rule(Rule("$", "$", "tex"))
add_rule(Rule("$$", "$$", "tex"))
add_rule(Rule("\\{", "\\}", "tex"))
add_rule(Rule("\\[", "\\]", "tex"))
add_rule(Rule("\"\"\"", "\"\"\"", "python"))
return add_rule(Rule("'''", "'''", "python"))
