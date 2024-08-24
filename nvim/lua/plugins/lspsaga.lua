return{
    "glepnir/lspsaga.nvim",
    branch = "main",
    event = "VeryLazy",
    config = function()
      require('lspsaga').setup({
         ui = {
    border = "rounded",
    title = false,
    colors = {
      normal_bg = "transparent",
      title_bg = ""
    },
    -- kind = require("catppuccin.groups.integrations.lsp_saga").custom_kind()
  },
  diagnostic = {
    show_code_action = false,
    show_source = true
  },
  lightbulb = {
    enable = false
  }
      })
    end
}
