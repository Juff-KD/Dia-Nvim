return {
	"folke/zen-mode.nvim",
	config = function()
		require("zen-mode").setup()
		vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<cr>", { silent = true })
	end,
	opts = {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
		on_open = function()
			vim.cmd("TWEnable")
		end,
		on_close = function()
			vim.cmd("TWDisable")
		end,
	},
}
