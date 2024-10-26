return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		{
			"s1n7ax/nvim-window-picker",
			name = "window-picker",
			event = "VeryLazy",
			version = "2.*",
			config = function()
				require("window-picker").setup()
			end,
		},

		{
			"b0o/nvim-tree-preview.lua",
			dependencies = { "nvim-lua/plenary.nvim" },
		},
	},

	config = function()
		local preview = require("nvim-tree-preview")
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")

			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			vim.keymap.set("n", "<C-t>", api.tree.change_root_to_parent, opts("Up"))
			vim.keymap.set("n", "?", api.tree.toggle_help, opts("Help"))
			vim.keymap.set("n", "P", preview.watch, opts("Preview (Watch)"))
			vim.keymap.set("n", "<Esc>", preview.unwatch, opts("Close Preview/Unwatch"))

			-- Option A: Smart tab behavior: Only preview files, expand/collapse directories (recommended)
			vim.keymap.set("n", "<Tab>", function()
				local ok, node = pcall(api.tree.get_node_under_cursor)
				if ok and node then
					if node.type == "directory" then
						api.node.open.edit()
					else
						preview.node(node, { toggle_focus = true })
					end
				end
			end, opts("Preview"))
		end

		require("nvim-tree").setup({
			on_attach = my_on_attach,
			diagnostics = {
				enable = true,
			},
			update_focused_file = {
				enable = true,
			},
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 24,
				side = "left",
			},
			filters = {
				dotfiles = true,
			},
			git = {
				ignore = false,
			},
			actions = {
				open_file = {
					window_picker = {
						enable = true,
						picker = function()
							return require("window-picker").pick_window({
								filter_rules = {
									file_path_contains = { "nvim-tree-preview://" },
								},
							})
						end,
					},
				},
			},
			renderer = {
				icons = {
					show = {
						git = true,
						folder = true,
						file = true,
						folder_arrow = false,
					},
					glyphs = {
						default = "",
						git = {
							unstaged = "◌",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "?",
							deleted = "",
							ignored = "✗",
						},
					},
				},
				indent_markers = {
					enable = true,
				},
			},
		})

		vim.keymap.set("n", "<Space>e", "<cmd>NvimTreeToggle<cr>", { noremap = true, silent = true })
	end,
}
