local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.keymap.set("i", "<C-K>", 'copilot#Accept("\\<CR>")', {
	expr = true,
	replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

map("n", "<Space>lz", "<cmd>Lazy<cr>", opts)
map("n", "<Space>bk", "<cmd>BinaryClock toggle<cr>", opts)
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

map(
	"n",
	"<Space>kr",
	"<cmd>lua require('kulala').run()<cr>",
	{ noremap = true, silent = true, desc = "Execute the request" }
)

map(
	"n",
	"[",
	"<cmd>lua require('kulala').jump_prev()<cr>",
	{ noremap = true, silent = true, desc = "Jump to the previous request" }
)
map(
	"n",
	"]",
	"<cmd>lua require('kulala').jump_next()<cr>",
	{ noremap = true, silent = true, desc = "Jump to the next request" }
)

map(
	"n",
	"<Space>koi",
	"<cmd>lua require('kulala').inspect()<cr>",
	{ noremap = true, silent = true, desc = "Inspect the current request" }
)

map(
	"n",
	"<Space>kt",
	"<cmd>lua require('kulala').toggle_view()<cr>",
	{ noremap = true, silent = true, desc = "Toggle between body and headers" }
)

map(
	"n",
	"<Space>kc",
	"<cmd>lua require('kulala').copy()<cr>",
	{ noremap = true, silent = true, desc = "Copy the current request as a curl command" }
)

map(
	"n",
	"<Sapce>ki",
	"<cmd>lua require('kulala').from_curl()<cr>",
	{ noremap = true, silent = true, desc = "Paste curl from clipboard as http request" }
)
