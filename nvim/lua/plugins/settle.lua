return {
	"zegervdv/settle.nvim",
	opt = true,
	cmd = { "SettleInit" },
	config = function()
		require("settle").setup({
			wrap = true,
			symbol = "!",
			keymaps = {
				next_conflict = "-n",
				prev_conflict = "-N",
				use_ours = "-u1",
				use_theirs = "-u2",
				close = "-q",
			},
		})
	end,
}
