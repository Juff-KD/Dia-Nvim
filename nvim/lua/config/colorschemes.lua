if vim.fn.has("termguicolors") then
	vim.opt.termguicolors = true
end

local ok_status, cit = pcall(require, "citruszest")
if not ok_status then
	return
end

cit.setup({
	option = {
		transparent = true, -- Enable/Disable transparency
		italic = true,
		bold = true,
	},
	-- Override default highlight style in this table
	-- E.g If you want to override `Constant` highlight style
	style = {
		-- This will change Constant foreground color and make it bold.
		Constant = { fg = "#Fe8091", bold = true },
	},
})

require("everblush").setup({

	-- Default options
	override = {},
	transparent_background = false,
	nvim_tree = {
		contrast = false,
	},

	-- Configuration examples

	-- Override the default highlights using Everblush or other colors
	-- override = {
	--     Normal = { fg = '#ffffff', bg = 'comment' },
	-- },
	--
	-- Set transparent background
	-- transparent_background = true,

	-- Set contrast for nvim-tree highlights
	-- nvim_tree = {
	--     contrast = true,
	-- },
})

local c = require("vscode.colors").get_colors()
require("vscode").setup({
	-- Alternatively set style in setup
	style = "dark",

	-- Enable transparent background
	transparent = false,

	-- Enable italic comment
	italic_comments = true,

	-- Disable nvim-tree background color
	disable_nvimtree_bg = true,

	-- Override colors (see ./lua/vscode/colors.lua)
	color_overrides = {
		vscLineNumber = "#4d4d4d",
		vscPopupFront = "#0efe5c",
		vscCursorDarkDark = "#333333",
	},

	-- Override highlight groups (see ./lua/vscode/theme.lua)
	group_overrides = {
		-- this supports the same val table as vim.api.nvim_set_hl
		-- use colors from this colorscheme by requiring vscode.colors!
		Cursor = { fg = c.vscDarkBlue, bg = c.vscLightGreen, bold = true },
	},
})

require("poimandres").setup({
	bold_vert_split = false, -- use bold vertical separators
	dim_nc_background = false, -- dim 'non-current' window backgrounds
	disable_background = false, -- disable background
	disable_float_background = true, -- disable background for floats
	disable_italics = false, -- disable italics
})

-- Lua
require("bamboo").setup({
	-- Main options --
	-- NOTE: to use the light theme, set `vim.o.background = 'light'`
	style = "vulgaris", -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
	toggle_style_key = nil, -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
	toggle_style_list = { "vulgaris", "multiplex", "light" }, -- List of styles to toggle between
	transparent = false, -- Show/hide background
	dim_inactive = false, -- Dim inactive windows/buffers
	term_colors = true, -- Change terminal color as per the selected theme style
	ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
	cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

	-- Change code style ---
	-- Options are anything that can be passed to the `vim.api.nvim_set_hl` table
	-- You can also configure styles with a string, e.g. keywords = 'italic,bold'
	code_style = {
		comments = { italic = true },
		conditionals = { italic = true },
		keywords = {},
		functions = {},
		namespaces = { italic = true },
		parameters = { italic = true },
		strings = {},
		variables = {},
	},

	-- Lualine options --
	lualine = {
		transparent = false, -- lualine center bar transparency
	},

	-- Custom Highlights --
	colors = {
		bright_orange = "#ff8800", -- define a new color
		green = "#00ffaa", -- redefine an existing color
	}, -- Override default colors
	highlights = {
		["@comment"] = { fg = "$grey" },
	}, -- Override highlight groups

	-- Plugins Config --
	diagnostics = {
		darker = false, -- darker colors for diagnostic
		undercurl = true, -- use undercurl instead of underline for diagnostics
		background = true, -- use background color for virtual text
	},
})
-- Default options
-- For using default config leave this empty.

vim.cmd([[colorscheme bamboo]])
--zellner(white),wildcharm(black),sorbet,retrobox
