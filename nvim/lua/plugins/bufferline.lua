return {
	"akinsho/bufferline.nvim",
	lazy = false,
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",

	config = function()
		require("bufferline").setup({
			options = {
				separator_style = "slant",
				hover = {
					enabled = true,
					delay = 200,
					reveal = { "close" },
				},
				sort_by = "id",
			},
			highlights = {
				tab_separator = {
					fg = "NONE",
					bg = "NONE",
				},
				close_button_selected = {
					fg = "#f97300",
					bg = "NONE",
				},
			},
		})
	end,
}
