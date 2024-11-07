return {
	"emmanueltouzery/decisive.nvim",
	config = function()
		require("decisive").setup({})
	end,
	lazy = true,
	ft = { "csv" },
	keys = {
		{
			"<Space>csa",
			":lua require('decisive').align_csv({})<cr>",
			{ silent = true },
			desc = "Align CSV",
			mode = "n",
		},
		{
			"<Space>csc",
			":lua require('decisive').align_csv_clear({})<cr>",
			{ silent = true },
			desc = "Align CSV clear",
			mode = "n",
		},
		{
			"[c",
			":lua require('decisive').align_csv_prev_col()<cr>",
			{ silent = true },
			desc = "Align CSV prev col",
			mode = "n",
		},
		{
			"]c",
			":lua require('decisive').align_csv_next_col()<cr>",
			{ silent = true },
			desc = "Align CSV next col",
			mode = "n",
		},
	},
}
