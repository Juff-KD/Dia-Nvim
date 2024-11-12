return {
	"NStefan002/screenkey.nvim",
	cmd = "Screenkey",
	version = "*",
	config = function()
		require("screenkey").setup({
			-- see :h nvim_open_win
			win_opts = {
				relative = "editor",
				anchor = "SE",
				width = 15,
				height = 3,
				border = "single",
			},
			-- compress input when repeated <compress_after> times
			compress_after = 3,
			-- clear the input after <clear_after> seconds of inactivity
			clear_after = 5,
			-- temporarily disable screenkey (for example when inside of the terminal)
			disable = {
				filetypes = {}, -- for example: "toggleterm"
				-- :h 'buftype'
				buftypes = {}, -- for example: "terminal"
			},
		})
	end,
	keys = { { "<Space>ko", "<cmd>Screenkey<cr>", desc = "Screenkey" } },
}
