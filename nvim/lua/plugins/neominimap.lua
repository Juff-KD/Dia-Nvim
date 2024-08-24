return {
	"Isrothy/neominimap.nvim",
	enabled = true,
	lazy = false, -- WARN: NO NEED to Lazy load
	init = function()
		vim.opt.wrap = false -- Recommended
		vim.opt.sidescrolloff = 36 -- It's recommended to set a large value
		vim.g.neominimap = {
			auto_enable = true,
			exclude_buftypes = {
				"nofile",
				"nowrite",
				"quickfix",
				"terminal",
				"prompt",
				"dashboard",
			},
			max_minimap_height = 25,
			minimap_width = 8,
			z_index = 1,
			window_border = "single",
			margin = {
				top = 0,
				bottom = 0,
				right = 0,
			},
		}
	end,
	--examples cmds
	--:Neominimap on
	--:Neominimap bufOff
	--:Neominimap winRefresh 3 4
}
