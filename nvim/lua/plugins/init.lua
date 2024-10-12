return {
	{ require("config.alpha") },
	-- { "folke/neodev.nvim", enabled = false }, -- make sure to uninstall or disable neodev.nvim

	{ "Everblush/nvim", name = "everblush", lazy = false, priority = 1000 },
	{ "Mofiqul/vscode.nvim", lazy = false, priority = 1000 },
	{ "scottmckendry/cyberdream.nvim", lazy = false, priority = 1000 },
	{ "olivercederborg/poimandres.nvim", lazy = false, priority = 1000 },
	{ "ribru17/bamboo.nvim", lazy = false, priority = 1000 },

	{
		"altermo/ultimate-autopair.nvim",
		event = { "InsertEnter", "CmdlineEnter" },
		branch = "v0.6", --recommended as each new version will have breaking changes
		opts = {
			--Config goes here
		},
	},
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
		-- use opts = {} for passing setup options
		-- this is equalent to setup({}) function
	},
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
		"NvChad/nvim-colorizer.lua",
		lazy = false,
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				buftypes = {},
			})
		end,
	},
	{
		"uga-rosa/ccc.nvim",
		event = "FileType",
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
		event = "BufReadPost",
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
	{
		"ckolkey/ts-node-action",
		dependencies = { "nvim-treesitter" },
		opts = {},
		config = function()
			vim.keymap.set({ "n" }, "KK", require("ts-node-action").node_action, { desc = "Trigger Node Action" })
		end,
	},
	{ "dsznajder/vscode-es7-javascript-react-snippets", run = "yarn install --frozen-lockfile && yarn compile" },
	{
		"kosayoda/nvim-lightbulb",
		lazy = false,
		config = function()
			require("nvim-lightbulb").setup({
				autocmd = { enabled = true },
			})
		end,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{
		"karb94/neoscroll.nvim",
		event = "BufRead",
		lazy = false,
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
		event = "BufEnter",
		lazy = false,
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
		"roodolv/markdown-toggle.nvim",
		config = function()
			require("markdown-toggle").setup({
				use_default_keymaps = true,
			})
		end,
	},
	{
		"pluffie/neoproj",
		cmd = { "ProjectOpen", "ProjectNew" },
	},
}
