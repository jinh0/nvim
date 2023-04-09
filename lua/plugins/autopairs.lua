return {
  -- Nice-to-haves
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function()
      local autopairs = require "nvim-autopairs"
      local Rule = require "nvim-autopairs.rule"

      local add_rule = function (x, y, z)
        autopairs.add_rule(Rule(x, y, z))
      end

      autopairs.setup {}

      add_rule("$", "$", "tex")
      add_rule("$$", "$$", "tex")
      add_rule("\\{", "\\}", "tex")
      add_rule("\\[", "\\]", "tex")
      add_rule('"""', '"""', "python")
      add_rule("'''", "'''", "python")
    end
  },
}
