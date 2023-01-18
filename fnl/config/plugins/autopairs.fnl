(local {: setup : add_rule} (require "nvim-autopairs"))
(local Rule (require "nvim-autopairs.rule"))

(setup)

(add_rule (Rule :$ :$ :tex))
(add_rule (Rule :$$ :$$ :tex))
(add_rule (Rule "\\{" "\\}" :tex))
(add_rule (Rule "\\[" "\\]" :tex))
(add_rule (Rule "\"\"\"" "\"\"\"" :python))
(add_rule (Rule "'''" "'''" :python))
