return {
	"booperlv/nvim-gomove", -- A complete plugin for moving and duplicating blocks and lines, with complete fold handling, reindenting, and undoing in one go
	opts = { map_defaults = false, reindent = true, undojoin = true },
	keys = {
		{ "HH", "<Plug>GoNSMLeft", mode = "n" },
		{ "JJ", "<Plug>GoNSMDown", mode = "n" },
		{ "KK", "<Plug>GoNSMUp", mode = "n" },
		{ "LL", "<Plug>GoNSMRight", mode = "n" },

		{ "HH", "<Plug>GoVSMLeft", mode = "v", "x" },
		{ "JJ", "<Plug>GoVSMDown", mode = "v", "x" },
		{ "KK", "<Plug>GoVSMUp", mode = "v", "x" },
		{ "LL", "<Plug>GoVSMRight", mode = "v", "x" },

		{ "<leader>HH", "<Plug>GoNSDLeft", mode = "n" },
		{ "<leader>JJ", "<Plug>GoNSDDown", mode = "n" },
		{ "<leader>KK", "<Plug>GoNSDUp", mode = "n" },
		{ "<leader>LL>", "<Plug>GoNSDRight", mode = "n" },

		{ "<leader>HH>", "<Plug>GoVSDUp", mode = "x", "v" },
		{ "<leader>LL", "<Plug>GoVSDRight", mode = "x", "v" },
		{ "<leader>JJ", "<Plug>GoVSDDown", mode = "x", "v" },
		{ "<leader>KK", "<Plug>GoVSDLeft", mode = "x", "v" },

		-- { '<M-Left>',    '<Plug>GoNSDLeft',  mode = 'n' },
		-- { '<M-Down>',    '<Plug>GoNSDDown',  mode = 'n' },
		-- { '<M-Up>',      '<Plug>GoNSDUp',    mode = 'n' },
		-- { '<M-Right>',   '<Plug>GoNSDRight', mode = 'n' },

		-- { '<M-Left>',    '<Plug>GoVSDLeft',  mode = 'x', 'v' },
		--   { '<M-Down>',    '<Plug>GoVSDDown',  mode = 'x', 'v' },
		--   { '<M-Up>',      '<Plug>GoVSDUp',    mode = 'x', 'v' },
		--   { '<M-Right>',   '<Plug>GoVSDRight', mode = 'x', 'v' }
	},
}
