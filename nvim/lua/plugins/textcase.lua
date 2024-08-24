return{
  "johmsalas/text-case.nvim",
  event = "VeryLazy",lazy = false,
  dependencies = { "nvim-telescope/telescope.nvim" },
  config = function()
    require("textcase").setup({})
    require("telescope").load_extension("textcase")
  end,
  keys = {
    "ga", -- Default invocation prefix
    { "ga.", "<cmd>TextCaseOpenTelescope<CR>", mode = { "n", "v" }, desc = "Telescope" },
  },
}
