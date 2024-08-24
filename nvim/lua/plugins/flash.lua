return {
  "folke/flash.nvim",
  event = "VeryLazy",
  ---@type Flash.Config
  opts = {},
  -- stylua: ignore
  keys = {
    { "fs",  mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "ffs", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
    { "ffr", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "fft", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "ft",  mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },
}
