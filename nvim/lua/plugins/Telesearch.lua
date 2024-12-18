return {
	"FabianWirth/search.nvim",
	dependencies = { "nvim-telescope/telescope.nvim" },
	config = function()
		local builtin = require("telescope.builtin")
		require("search").setup({
			mappings = { -- optional: configure the mappings for switching tabs (will be set in normal and insert mode(!))
				next = "<Tab>",
				prev = "<S-Tab>",
			},
			append_tabs = { -- append_tabs will add the provided tabs to the default ones
				{
					"Commits", -- or name = "Commits"
					builtin.git_commits, -- or tele_func = require('telescope.builtin').git_commits
					available = function() -- optional
						return vim.fn.isdirectory(".git") == 1
					end,
				},
			},
			-- its also possible to overwrite the default tabs using the tabs key instead of append_tabs
			tabs = {
				{
					"Files",
					function(opts)
						opts = opts or {}
						if vim.fn.isdirectory(".git") == 1 then
							builtin.git_files(opts)
						else
							builtin.find_files(opts)
						end
					end,
				},
			},
		})
	end,

	vim.keymap.set("n", "<space>fs", function()
		require("search").open()
	end, { noremap = true, silent = true }),
}
