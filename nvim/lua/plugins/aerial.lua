return {
	"stevearc/aerial.nvim",
	lazy = false,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
		{
			"stevearc/stickybuf.nvim",
			opts = {},
		},
	},
	opts = function()
		require("aerial").setup({
			layout = {
				max_width = { 40, 0.4 },
				width = nil,
				min_width = 10,
				default_direction = "prefer_right",
				placement = "window",
				resize_to_content = false,
				preserve_equality = false,
			},
			highlight_on_hover = true,
			autojump = true,
			-- open_automatic = true,
			highlight_on_jump = false,
			manage_folds = true,
			show_guides = true,
			-- optionally use on_attach to set keymaps when aerial has attached to a buffer
			on_attach = function(bufnr)
				-- Jump forwards/backwards with '{' and '}'
				vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
				vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
			end,
		})
		-- You probably also want to set a keymap to toggle aerial
		vim.keymap.set("n", "<Space>a", "<cmd>AerialToggle!<CR>")
	end,
	-- Optional dependencies
}
