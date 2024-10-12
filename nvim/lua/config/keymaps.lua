local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<Space>bh", ":BufferHistory reopen<CR>", { silent = true })
map({ "i", "x", "n", "s" }, "<Space>w", "<cmd>w<cr>", { desc = "Save File" })
map("n", "<A-q>", "<cmd>q<cr>", opts) -- Quit all windows (silent)

map("v", "<A-j>", "<C-d>")
map("v", "<A-k>", "<C-u>")
map("i", "<A-j>", "<Down>")
map("i", "<A-k>", "<Up>")

map("n", "<A-l>", "<C-w>l")
map("n", "<A-h>", "<C-w>h")

map("n", "<A-k>", "<CMD>bnext<cr>")
map("n", "<A-j>", "<CMD>bprevious<cr>")

map("n", "H", "<cmd>BufferLineCyclePrev<cr>")
map("n", "L", "<cmd>BufferLineCycleNext<cr>")
map("n", "<A-c>", "<cmd>bd<cr>")
map("i", "jk", "<Esc>")

map("n", "tn", "<CMD>tabnew<cr>")
map("n", "cc", "<CMD>close<cr>")
map("n", "sp", ":split<Return><C-w>w")
map("n", "vs", ":vsplit<Return><C-w>w")

-- Copy to system clipboard
map("v", "<C-c>", '"+y')
-- Paste from system clipboard with Ctrl + v
-- Paste from system clipboard with Ctrl + v
map("i", "<C-v>", '<Esc>"+p')
map("n", "<Leader>h", 'viw"0p', { nowait = false })

-- map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
-- map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
-- map("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
-- map("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
map({ "v", "n" }, "<Space>mn", function()
	require("neominimap").toggle()
end, opts)
map("n", "tw", ":Twilight<cr>", { noremap = true })
map("n", "<Space>nv", "<cmd>Navbuddy<cr>", { noremap = true })
-- map('n', '<leader>nn', '<CMD>Neotree float<CR>')

map("n", "]t", function()
	require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

map("n", "[t", function()
	require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

map("n", "<Space>u", "<Cmd>UfoEnable<CR>", { noremap = true, silent = true })
map("n", "<Space>uu", "<Cmd>UfoDisable<CR>", { noremap = true, silent = true })

map("n", "<Space>md", ":MarkdownPreview<cr>", { noremap = true, silent = true })
map("n", "<Space>mc", ":MarkdownPreviewStop<cr>", { noremap = true, silent = true })

map({ "n", "x" }, "<Space>sr", function()
	require("ssr").open()
end)

map("n", "<Space>kk", ":Telescope colorscheme <cr>", { silent = true, noremap = true })

map({ "n", "i" }, "<Space>tw", "<cmd>TWToggle<cr>", opts)
