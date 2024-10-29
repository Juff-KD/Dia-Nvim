return {
	"akinsho/toggleterm.nvim",
	event = "VimEnter",
	version = "*",
	opts = function()
		local map = vim.keymap.set

		function _G.set_toggleterm_keybind()
			local opts = { buffer = 0 }
			-- map('t', '<space>;', [[<C-\><C-n>]], opts)
			map("t", "<A-t>", "<cmd>ToggleTerm<cr>", opts)
			map("t", "<esc>", [[<C-\><C-n>]], opts)
			map("t", "jk", [[<C-\><C-n>]], opts)
			map("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
			map("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
			map("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
			map("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
			map("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
		end

		vim.cmd("autocmd! TermOpen term://*toggleterm* lua set_toggleterm_keybind()")
		map("n", "<A-t>", "<cmd>ToggleTerm direction=float<cr>", { noremap = true, silent = true })

		local trim_spaces = true
		vim.keymap.set("v", "<space>y", function()
			require("toggleterm").send_lines_to_terminal("single_line", trim_spaces, { args = vim.v.count })
		end)
		vim.keymap.set("v", "<space>Y", function()
			require("toggleterm").send_lines_to_terminal("visual_lines", trim_spaces, { args = vim.v.count })
		end)
		-- Replace with these for the other two options
		-- require("toggleterm").send_lines_to_terminal("visual_selection", trim_spaces, { args = vim.v.count })
	end,
	config = function()
		require("toggleterm").setup({
			size = function(term)
				if term.direction == "horizontal" then
					return 13
				elseif term.direction == "vertical" then
					return vim.o.columns * 0.4
				end
			end,
			shell = vim.o.shell,
			auto_scroll = true,
			persist_size = true,
			persist_mode = true,
			winbar = {
				enabled = false,
				name_formatter = function(term) --  term: Terminal
					return term.name
				end,
			},
		})
	end,
}
