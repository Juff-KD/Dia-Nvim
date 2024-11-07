return {
	"romgrk/barbar.nvim",
	event = "BufEnter",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	},
	init = function()
		vim.g.barbar_auto_setup = false
	end,
	-- opts = {},
	opts = {
		-- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
		animation = true,
		-- insert_at_start = true,
		-- …etc.
		maximum_length = 6,
		tabpages = true,
		clickable = true,
		--' s'eparator = {left = '▎', right = ''}, ''''
		icons = {
			-- separator = { left = " ", right = "" },
			separator_at_end = false,
			preset = "slanted", -- can be 'default', 'powerline', or 'slanted'
		},
	},
	version = "^1.0.0", -- optional: only update when a new 1.x version is released
}
