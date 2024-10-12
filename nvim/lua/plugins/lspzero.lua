return {
	"VonHeikemen/lsp-zero.nvim",
	branch = "v3.x",
	lazy = false,
	dependencies = {
		{
			"neovim/nvim-lspconfig",
			dependencies = {
				{
					"SmiteshP/nvim-navbuddy",
					dependencies = {
						"SmiteshP/nvim-navic",
						"MunifTanjim/nui.nvim",
					},
					opts = { lsp = { auto_attach = true } },
				},
			},
		},
		{
			"hrsh7th/nvim-cmp",
			version = false,
			event = "InsertEnter",
			dependencies = {
				"luckasRanarison/tailwind-tools.nvim",
				"onsails/lspkind-nvim",
				"hrsh7th/cmp-nvim-lsp",
				"hrsh7th/cmp-buffer",
				"hrsh7th/cmp-path",
			},
			opts = function()
				-- ...
				Formatting = {
					format = require("lspkind").cmp_format({
						before = require("tailwind-tools.cmp").lspkind_format,
					}),
				}
			end,
		},
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"onsails/lspkind.nvim",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-emoji",
		"L3MON4D3/LuaSnip",
		"rafamadriz/friendly-snippets",
		"neovim/nvim-lspconfig",
	},
	event = "VeryLazy",
	config = function()
		local lsp_zero = require("lsp-zero")
		-- local lspconfig = require('lspconfig')

		lsp_zero.on_attach(function(client, bufnr)
			-- see :help lsp-zero-keybindings
			-- to learn the available actions
			-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
			local bufopt = { noremap = true, silent = true, buffer = bufnr }
			local bind = vim.keymap.set

			bind("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", bufopt)

			bind("n", "K", "<cmd>Lspsaga hover_doc<cr>", bufopt)

			bind("n", "<leader>ca", vim.lsp.buf.code_action, bufopt)
			bind("n", "<leader>lf", function()
				vim.lsp.buf.format({ async = true })
			end, bufopt)

			-- Lspsaga Diagnostic
			bind("n", "<leader>dl", "<cmd>Lspsaga diagnostic_jump_next<cr>", bufopt)
			bind("n", "<leader>dh", "<cmd>Lspsaga diagnostic_jump_prev<cr>", bufopt)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		lsp_zero.set_sign_icons({
			error = "✘",
			warn = "▲",
			hint = "⚑",
			info = "»",
		})

		require("lspkind").init({
			-- DEPRECATED (use mode instead): enables text annotations
			--
			-- default: true
			-- with_text = true,

			-- defines how annotations are shown
			-- default: symbol
			-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
			mode = "symbol_text",

			-- default symbol map
			-- can be either 'default' (requires nerd-fonts font) or
			-- 'codicons' for codicon preset (requires vscode-codicons font)
			--
			-- default: 'default'
			preset = "codicons",

			-- override preset symbols
			--
			-- default: {}
			symbol_map = {
				Text = "󰉿",
				Method = "󰆧",
				Function = "󰊕",
				Constructor = "",
				Field = "󰜢",
				Variable = "󰀫",
				Class = "󰠱",
				Interface = "",
				Module = "",
				Property = "󰜢",
				Unit = "󰑭",
				Value = "󰎠",
				Enum = "",
				Keyword = "󰌋",
				Snippet = "",
				Color = "󰏘",
				File = "󰈙",
				Reference = "󰈇",
				Folder = "󰉋",
				EnumMember = "",
				Constant = "󰏿",
				Struct = "󰙅",
				Event = "",
				Operator = "󰆕",
				TypeParameter = "",
			},
		})

		require("mason").setup({})
		require("mason-lspconfig").setup({
			ensure_installed = { "lua_ls", "ts_ls" },
			handlers = {
				lsp_zero.default_setup,
				function(server_name)
					require("lspconfig")[server_name].setup({})
				end,
				-- (Optional) configure lua language servers
				-- lua_ls = function()
				--   local lua_opts = lsp_zero.nvim_lua_ls()
				--   require('lspconfig').lua_ls.setup(lua_opts)
				-- end,
			},
			Settings = {
				Lua = {
					workspace = { checkThirdParty = false },
					telemetry = { enable = false },
					diagnostics = {
						disable = { "missing-fields" },
					},
				},
			},
		})

		--lua_ls
		require("lspconfig").lua_ls.setup({
			settings = {
				Lua = {},
			},
			on_init = function(client)
				local uv = vim.uv or vim.loop
				local path = client.workspace_folders[1].name

				-- Don't do anything if there is a project local config
				if uv.fs_stat(path .. "/.luarc.json") or uv.fs_stat(path .. "/.luarc.jsonc") then
					return
				end

				-- Apply neovim specific settings
				local lua_opts = lsp_zero.nvim_lua_ls()

				client.config.settings.Lua =
					vim.tbl_deep_extend("force", client.config.settings.Lua, lua_opts.settings.Lua)
			end,
		})
		-- Autocompletion config
		---
		local cmp = require("cmp")
		local cmp_action = lsp_zero.cmp_action()
		local luasnip = require("luasnip")
		cmp.setup({
			mapping = cmp.mapping.preset.insert({
				-- `Enter` key to confirm completion
				["<CR>"] = cmp.mapping.confirm({ select = false }),

				-- Ctrl+Space to trigger completion menu
				["<C-Space>"] = cmp.mapping.complete(),

				-- Navigate between snippet placeholder
				["<C-f>"] = cmp_action.luasnip_jump_forward(),
				["<C-b>"] = cmp_action.luasnip_jump_backward(),

				-- Scroll up and down in the completion documentation
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_jumpable() then
						luasnip.expand_or_jump()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-2) then
						luasnip.jump(-2)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<Enter>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			snippet = {
				expand = function(args)
					require("luasnip").lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			sources = {
				{ name = "nvim_lsp" },
				{ name = "path" },
				{ name = "emoji" },
			},
			{
				{ name = "buffer" },
				{ name = "nvim_lua" },
				{ name = "luasnip", keyword_length = 2 },
				{ name = "codeium" },
				{ name = "friendly-snippets" },
				{ name = "otter" },
			},
			formattingConfig = {
				format = require("lspkind").cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					ellipsis_char = "...",
					symbol_map = { Codeium = "" },
					before = require("tailwind-tools.cmp").lspkind_format,
				}),
			},
		})
	end,
}
