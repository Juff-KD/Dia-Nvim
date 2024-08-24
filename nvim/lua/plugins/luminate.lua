return {
	"mei28/luminate.nvim",
	event = { "VeryLazy" },
	config = function()
		-- if you want to customize, see Usage!
		require("luminate").setup({
			duration = 500, -- Duration of the highlight in milliseconds. Default is 500.
			yank = {
				hlgroup = "LuminateYank", -- Highlight group for yanked text. Default is "LuminateYank".
				guibg = "#2d4f67", -- Background color for GUIs. Default is "#2d4f67".
				fg = "#ebcb8b", -- Foreground color. Default is "#ebcb8b".
				enabled = true, -- Enable highlight on yank. Default is true.
			},
			paste = {
				hlgroup = "LuminatePaste", -- Highlight group for pasted text. Default is "LuminatePaste".
				guibg = "#2d4f67", -- Background color for GUIs. Default is "#2d4f67".
				fg = "#ebcb8b", -- Foreground color. Default is "#ebcb8b".
				enabled = true, -- Enable highlight on paste. Default is true.
				mode = "n", -- Mode in which to map paste. Default is 'n' (normal mode).
				lhs = { "p", "P" }, -- Keybindings for paste. Default is {'p', 'P'}.
				map = { p = "p", P = "P" }, -- Commands to execute for paste.
				opts = {}, -- Options for keymap. Default is {}.
			},
			undo = {
				hlgroup = "LuminateUndo", -- Highlight group for undo. Default is "LuminateUndo".
				guibg = "#2d4f67", -- Background color for GUIs. Default is "#2d4f67".
				fg = "#ebcb8b", -- Foreground color. Default is "#ebcb8b".
				mode = "n", -- Mode in which to map undo. Default is 'n' (normal mode).
				lhs = { "u", "U" }, -- Keybindings for undo. Default is {'u', 'U'}.
				map = { u = "u", U = "U" }, -- Commands to execute for undo.
				opts = {}, -- Options for keymap. Default is {}.
				enabled = true, -- Enable highlight on undo. Default is true.
			},
			redo = {
				hlgroup = "LuminateRedo", -- Highlight group for redo. Default is "LuminateRedo".
				guibg = "#2d4f67", -- Background color for GUIs. Default is "#2d4f67".
				fg = "#ebcb8b", -- Foreground color. Default is "#ebcb8b".
				mode = "n", -- Mode in which to map redo. Default is 'n' (normal mode).
				lhs = { "<C-r>" }, -- Keybinding for redo. Default is {'<C-r>'}.
				map = "<C-r>", -- Command to execute for redo. Default is 'redo'.
				opts = {}, -- Options for keymap. Default is {}.
				enabled = true, -- Enable highlight on redo. Default is true.
			},
			highlight_for_count = true, -- Highlight for count in undo/redo. Default is true.
		})
	end,
}
