require("config.lazy")
require("config.keymaps")
require("config.options")
require("config.colorschemes")
-- Make sure you have ripgrep installed.
-- Add the following function to your `~/.config/nvim/init.lua`:
--
-- vim.api.nvim_create_autocmd("FileType", {
-- 	desc = "markdown-toggle.nvim keymaps",
-- 	pattern = { "markdown", "markdown.mdx" },
-- 	callback = function(args)
-- local opts = { silent = true, noremap = true, buffer = args.buf }
-- local toggle = require("markdown-toggle")

-- Keymap configurations will be added here for each feature
-- opts.expr = true -- required for dot-repeat in Normal mode
-- vim.keymap.set("n", "<C-mq>", toggle.quote_dot, opts)
-- vim.keymap.set("n", "<C-ml>", toggle.list_dot, opts)
-- vim.keymap.set("n", "<C-mn>", toggle.olist_dot, opts)
-- vim.keymap.set("n", "<Leader><C-x>", toggle.checkbox_dot, opts)
-- vim.keymap.set("n", "<C-mh>", toggle.heading_dot, opts)
--
-- opts.expr = false -- required for Visual mode
-- vim.keymap.set("x", "<C-mq>", toggle.quote, opts)
-- vim.keymap.set("x", "<C-ml>", toggle.list, opts)
-- vim.keymap.set("x", "<C-mn>", toggle.olist, opts)
-- vim.keymap.set("x", "<Leader><C-x>", toggle.checkbox, opts)
-- vim.keymap.set("x", "<C-mh>", toggle.heading, opts)
-- 	end,
-- })

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
