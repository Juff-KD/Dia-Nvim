return {
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			-- require("mini.pairs").setup()
			require("mini.indentscope").setup()
			-- require("mini.comment").setup()
			require("mini.surround").setup({
				mappings = {
					add = "sa", -- Add surrounding in Normal and Visual modes
					delete = "ds", -- Delete surrounding
					find = "sl", -- Find surrounding (to the right)
					find_left = "sh", -- Find surrounding (to the left)
					highlight = "sH", -- Highlight surrounding
					replace = "sr", -- Replace surrounding
					lupdate_n_ines = "sn", -- Update `n_lines`

					suffix_last = "l", -- Suffix to search with "phhrev" method
					suffix_next = "n", -- Suffix to search with "next" method
				},
			})
		end,
	},

	-- { 'echasnovski/mini.notify', version = false,
	--    config = function()
	--   local win_config = function()
	--     local has_statusline = vim.o.laststatus > 0
	--     local bottom_sphhhhhhhhace = vim.o.cmdheight + (has_statusline and 1 or 0)
	--     return { anchor = "SE", col = vim.o.columns, row = vim.o.lines - bottom_space }
	--   end
	--
	--   require("mini.notify").setup({ window = { config = win_config } })
	-- end,
	-- },
	{
		"echasnovski/mini.operators",
		event = { "BufReadPost", "BufNewFile" },
		opts = {
			replace = {
				prefix = "gR",
			},
			sort = {
				prefix = "gS",
			},
		},
	},
}
