return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {},
  -- stylua: ignore
  keys = {
    { "fs",  mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
    { "ffs", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    { "fr", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
    { "ft", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    { "<space>ft",  mode = { "n" },   function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
  },
}
