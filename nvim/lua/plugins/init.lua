return {
	-- { require("config.alpha") },
	-- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim
	{ "github/copilot.vim", event = "BufEnter" },
	{ "zootedb0t/citruszest.nvim", lazy = true, priority = 1000 },
	{ "EdenEast/nightfox.nvim", lazy = false, priority = 1000 }, -- lazy
	{ "Mofiqul/vscode.nvim", lazy = false, priority = 1000 },
	{ "olivercederborg/poimandres.nvim", lazy = "VeryLazy", priority = 1000 },
	{ "ribru17/bamboo.nvim", lazy = "VeryLazy", priority = 1000 },
	-- plugins specs..
	{
		"nvim-neorg/neorg",
		-- lazy = true, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		event = "BufReadPost",
		version = "*", -- Pin Neorg to the latest stable release
		opts = {
			load = {
				["core.integrations.telescope"] = {
					config = {
						insert_file_link = {
							-- Whether to show the title preview in telescope. Affects performance with a large
							-- number of files.
							show_title_preview = true,
						},
					},
				},
			},
		},
		config = true,
		keys = { { "<leader>fn", "<Plug>(neorg.telescope.find_norg_files)", desc = "Open Neorg" } },
		dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
	},
	{
		"wurli/visimatch.nvim",
		event = "VeryLazy",
		opts = {
			hl_group = "Search",
			-- The minimum number of selected characters required to trigger highlighting
			chars_lower_limit = 5,
			-- The maximum number of selected lines to trigger highlighting for
			lines_upper_limit = 30,
			-- By default, visimatch will highlight text even if it doesn't have exactly
			-- the same spacing as the selected region. You can set this to `true` if
			-- you're not a fan of this behaviour :)
			strict_spacing = false,
			-- Visible buffers which should be highlighted. Valid options:
			-- * `"filetype"` (the default): highlight buffers with the same filetype
			-- * `"current"`: highlight matches in the current buffer only
			-- * `"all"`: highlight matches in all visible buffers
			buffers = "filetype",
			-- Case-(in)nsitivity for matches. Valid options:
			-- * `true`: matches will never be case-sensitive
			-- * `false`/`{}`: matches will always be case-sensitive
			-- * a table of filetypes to use use case-insensitive matching for.
			case_insensitive = { "markdown", "text", "help" },
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
	-- sm plugins..
	{ "elliotxx/copypath.nvim", config = true },
	{
		"4DRIAN0RTIZ/binaryclock.nvim",
		event = "VeryLazy",
	},
	{ "axieax/urlview.nvim", event = "VeryLazy", opts = { default_picker = "telescope" } },
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to "use" `main` branch for the latest featuresk
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	{
		"folke/twilight.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"NvChad/nvim-colorizer.lua",
		event = "BufReadPost",
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				buftypes = {},
			})
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		lazy = true,
		event = { "BufReadPost" }, --, "FileType"
		keys = { { "<Leader>cp", "<cmd>CccPick<CR>", desc = "Color-picker" } },
		opts = {
			highlighter = { auto_enable = true, lsp = true, excludes = { "lazy", "mason", "help", "neo-tree" } },
		},
	},
	{
		"roobert/tailwindcss-colorizer-cmp.nvim",
		-- optionally, override the default options:
		config = function()
			require("tailwindcss-colorizer-cmp").setup({
				color_square_width = 2,
			})
		end,
	},
	{
		"gbprod/cutlass.nvim",
		-- event = "BufReadPost",
		opts = {
			cut_key = "x",
			override_del = true,
			exclude = {},
			registers = {
				select = "_",
				delete = "_",
				change = "_",
			},
		},
	},
	{ "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" },
	{
		"folke/todo-comments.nvim",
		event = "BufReadPost",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"Dan7h3x/LazyDo",
		branch = "main",
		keys = { -- recommended keymap for easy toggle LazyDo in normal and insert modes (arbitrary)
			{
				"<F2>",
				"<ESC><CMD>LazyDoToggle<CR>",
				mode = { "n", "i" },
			},
		},
		event = "VeryLazy",
		opts = {
			-- your config here
		},
	},
	{
		"karb94/neoscroll.nvim",
		event = "BufReadPost",
		enabled = true,
	},
	{
		"TheLeoP/powershell.nvim",
		---@type powershell.user_config
		opts = {
			capabilities = vim.lsp.protocol.make_client_capabilities(),
			bundle_path = vim.fn.stdpath("data") .. "/mason/packages/powershell-editor-services",
			init_options = vim.empty_dict(),
			settings = vim.empty_dict(),
			shell = "pwsh",
		},
		config = function()
			-- This is the default configuration
			vim.keymap.set("n", "g#", function()
				require("powershell").toggle_term()
			end)
		end,
	},
	{
		"joshuadanpeterson/typewriter",
		lazy = true,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("typewriter").setup({
				enable_with_zen_mode = true,
				keep_cursor_position = true,
				enable_notifications = true,
				enable_horizontal_scroll = true,
			})
		end,
		opts = {},
	},
	{
		"jakewvincent/mkdnflow.nvim",
		lazy = true,
		ft = "markdown",
		config = function()
			require("mkdnflow").setup({
				-- Config goes here; leave blank for defaults
			})
		end,
	},
	{
		"pluffie/neoproj",
		cmd = { "ProjectOpen", "ProjectNew" },
	},
	{
		"HiPhish/rainbow-delimiters.nvim",
		event = "BufRead",
		config = function()
			-- This module contains a number of default definitions
			local rainbow_delimiters = require("rainbow-delimiters")

			---@type rainbow_delimiters.config
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					vim = rainbow_delimiters.strategy["local"],
				},
				query = {
					[""] = "rainbow-delimiters",
					lua = "rainbow-blocks",
				},
				priority = {
					[""] = 110,
					lua = 210,
				},
				highlight = {
					"RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},
	{
		"rachartier/tiny-inline-diagnostic.nvim",
		event = "VeryLazy", -- `VeryLazy` Or `LspAttach`
		priority = 1000, -- needs to be loaded in first
		config = function()
			vim.diagnostic.config({ virtual_text = false })
			require("tiny-inline-diagnostic").setup()
		end,
	},
}
