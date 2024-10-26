return {
	"brenton-leighton/multiple-cursors.nvim",
	version = "*", -- Use the latest tagged version
	opts = {
		pre_hook = function()
			vim.opt.cursorline = false
			vim.cmd("NoMatchParen")
			vim.g.minipairs_disable = true
			vim.g.codeium_enabled = false
			require("nvim-autopairs").disable()
			require("cmp").setup({ enabled = false })
		end,
		post_hook = function()
			vim.opt.cursorline = true
			vim.cmd("DoMatchParen")
			vim.g.minipairs_disable = false
			vim.g.codeium_enabled = true
			require("nvim-autopairs").enable()
			require("cmp").setup({ enabled = true })
		end,
		custom_key_maps = {
			{
				"n",
				"<Space>|",
				function()
					require("multiple-cursors").align()
				end,
			},
			{
				{ "n", "i" },
				"<C-/>",
				function()
					vim.cmd("normal gcc")
				end,
			},
			{
				"v",
				"<C-/>",
				function()
					vim.cmd("normal gc")
				end,
			},
		},
	}, -- This causes the plugin setup function to be called
	keys = {
		-- { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
		-- { "<C-ck>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },

		{ "<C-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
		{ "<C-Down>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move down" },

		{
			"<C-LeftMouse>",
			"<Cmd>MultipleCursorsMouseAddDelete<CR>",
			mode = { "n", "i" },
			desc = "Add or remove cursor",
		},

		{ "<Leader>cm", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to cword" },
		{
			"<Leader>cmm",
			"<Cmd>MultipleCursorsAddMatchesV<CR>",
			mode = { "n", "x" },
			desc = "Add cursors to cword in previous area",
		},

		{
			"<Leader>cna",
			"<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
			mode = { "n", "x" },
			desc = "Add cursor and jump to next cword",
		},
		{ "<Leader>cn", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },

		{ "<Leader>cl", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
	},
}
