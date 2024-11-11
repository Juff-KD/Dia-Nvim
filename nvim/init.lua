vim.g.mapleader = " " -- LazyVim auto format
vim.g.maplocalleader = " "
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1

require("config.lazy")
require("config.options")
require("config.keymaps")
require("config.colorschemes")

vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
	callback = function()
		if vim.g.project_root ~= nil then
			require("neoproj").save_session()
		end
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	desc = "Pin the buffer to any window that is fixed width or height",
	callback = function() --args
		local stickybuf = require("stickybuf")
		if not stickybuf.is_pinned() and (vim.wo.winfixwidth or vim.wo.winfixheight) then
			stickybuf.pin()
		end
	end,
})
