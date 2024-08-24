return {
	"AgusDOLARD/backout.nvim",
	opts = { chars = "(){}[]`'\"<>" }, -- default chars
	keys = {
		-- Define your keybinds
		{ "<A-[>", "<cmd>lua require('backout').back()<cr>", mode = { "i" } },
		{ "<A-]>", "<cmd>lua require('backout').out()<cr>", mode = { "i" } },
	},
}
