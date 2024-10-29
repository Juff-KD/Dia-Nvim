return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	event = "VeryLazy",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-lua/popup.nvim",
		-- "sharkdp/fd",
		"ibhagwan/fzf-lua",
		"nvim-treesitter/nvim-treesitter",
		{
			"polirritmico/telescope-lazy-plugins.nvim",
			keys = {
				{ "<Space>tp", "<Cmd>Telescope lazy_plugins<CR>", desc = "Telescope: Plugins configurations" },
			},
		},
		"crispgm/telescope-heading.nvim",
		{
			"RutaTang/quicknote.nvim",
			config = function()
				-- you must call setup to let quicknote.nvim works correctly
				require("quicknote").setup({
					mode = "portable", -- "portable" | "resident", default to "portable"
					sign = "N", -- This is used for the signs on the left side (refer to ShowNoteSigns() api).
					-- You can change it to whatever you want (eg. some nerd fonts icon), 'N' is default
					filetype = "md",
					git_branch_recognizable = true,
				})
				vim.api.nvim_set_keymap(
					"n",
					"<Space>qnc",
					"<cmd>lua require('quicknote').NewNoteAtCurrentLine()<cr>",
					{ noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Space>qns",
					"<cmd>lua require('quicknote').ToggleNoteSigns()<cr>",
					{ noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Space>qno",
					"<cmd>lua require('quicknote').OpenNoteAtCurrentLine()<cr>",
					{ noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Space>qnw",
					"<cmd>lua require('quicknote').NewNoteAtCWD()<cr>",
					{ noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Space>qdw",
					"<cmd>lua require('quicknote').DeleteNoteAtCWD()<cr>",
					{ noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Space>qdc",
					"<cmd>lua require('quicknote').DeleteNoteAtCurrentLine()<cr>",
					{ noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Space>qnl",
					"<cmd>lua require('quicknote').ListNotesForCurrentBuffer()<cr>",
					{ noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Space>qj",
					"<cmd>lua require('quicknote').JumpToNextNote()<cr>",
					{ noremap = true }
				)
				vim.api.nvim_set_keymap(
					"n",
					"<Space>qk",
					"<cmd>lua require('quicknote').JumpToPreviousNote()<cr>",
					{ noremap = true }
				)
			end,
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},
	config = function()
		local builtin = require("telescope.builtin")
		local actions = require("telescope.actions")
		local telescope = require("telescope")
		telescope.setup({
			defaults = {
				layout_config = {
					width = 0.75,
					prompt_position = "bottom",
					preview_cutoff = 80,
					horizontal = { mirror = false },
					vertical = { mirror = false },
				},
				find_command = {
					"rg",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
				prompt_prefix = "  ", --" ",
				selection_caret = " ",
				entry_prefix = "  ",
				initial_mode = "insert",
				selection_strategy = "reset",
				sorting_strategy = "descending",
				layout_strategy = "horizontal",
				file_sorter = require("telescope.sorters").get_fuzzy_file,
				file_ignore_patterns = {},
				generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
				path_display = {},
				winblend = 0,
				border = {},
				borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
				color_devicons = true,
				use_less = true,
				set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
				file_previewer = require("telescope.previewers").vim_buffer_cat.new,
				grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
				qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
				buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
						["<esc>"] = actions.close,
						["<CR>"] = actions.select_default + actions.center,
					},
					n = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
					},
				},
				pickers = {
					find_files = {
						mappings = {
							n = {
								["cd"] = function(prompt_bufnr)
									local selection = require("telescope.actions.state").get_selected_entry()
									local dir = vim.fn.fnamemodify(selection.path, ":p:h")
									require("telescope.actions").close(prompt_bufnr)
									-- Depending on what you want put `cd`, `lcd`, `tcd`
									vim.cmd(string.format("silent lcd %s", dir))
								end,
							},
						},
					},
				},
				extensions = {
					quicknote = {
						defaultScope = "CWD",
					},
					heading = {
						treesitter = true,
						picker_opts = {
							layout_config = { width = 0.8, preview_width = 0.5 },
							layout_strategy = "horizontal",
						},
					},
					lazy_plugins = {
						lazy_config = vim.fn.stdpath("config") .. "/lua/lazy/init.lua", -- Must be a valid path to the file containing the lazy spec and setup() call.
					},
					import = {
						-- Add imports to the top of the file keeping the cursor in place
						insert_at_top = true,
						-- Support additional languages
						custom_languages = {
							{
								-- The regex pattern for the import statement
								regex = [[^(?:import(?:[\"'\s]*([\w*{}\n, ]+)from\s*)?[\"'\s](.*?)[\"'\s].*)]],
								-- The Vim filetypes
								filetypes = { "typescript", "typescriptreact", "javascript", "react" },
								-- The filetypes that ripgrep supports (find these via `rg --type-list`)
								extensions = { "js", "ts" },
							},
						},
					},
				},
			},
		})
		vim.keymap.set("n", "<Space>ff", builtin.find_files, { noremap = true })
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<space>fz", "<cmd>FzfLua<Cr>", { noremap = true })

		telescope.load_extension("heading")
		telescope.load_extension("quicknote")
		telescope.load_extension("lazygit")
		telescope.load_extension("lazy_plugins")
	end,
}
