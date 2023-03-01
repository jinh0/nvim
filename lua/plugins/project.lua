return {
  {
    "ahmedkhalf/project.nvim",
    config = function ()
      require 'project_nvim'.setup {
        patterns = {
          ".git", "package.json", ">dev"
        },
        detection_methods = { "pattern" },
      }
    end
  }
}
