return {
	"hedyhli/outline.nvim",
	event = "BufReadPost",
	cmd = { "Outline", "OutlineOpen" },
	keys = { -- Example mapping to toggle outline
		{ "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
	},
	opts = {},
	config = function()
		-- Your setup opts here
		require("outline").setup({
			outline_window = {
				position = "left",
			},
		})
	end,
}
