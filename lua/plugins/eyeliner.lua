return {
  {
    'jinh0/eyeliner.nvim',
    event = "VeryLazy",
    dev = true,
    config = function ()
      require "eyeliner".setup {
        highlight_on_key = true,
        dim = true
      }
    end
  }
}
