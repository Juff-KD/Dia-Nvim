-- lazy
return {
	"sontungexpt/sttusline",
	branch = "table_version",
	-- pin = true,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = { "VimEnter" },
	config = function(_, opts)
		local uv = vim.uv or vim.loop
		local colors = require("sttusline.utils.color")
		require("sttusline").setup({
			on_attach = function(create_update_group)
				create_update_group("GROUP_NAME", {
					event = { "BufEnter" },
					user_event = { "VeryLazy" },
					timing = false,
				})
			end,

			-- the colors of statusline will be set follow the colors of the active buffer
			-- statusline_color = "#fdff00",
			statusline_color = "", --"StatusLine",
			disabled = {
				filetypes = {
					-- "NvimTree",
					-- "lazy",
				},
				buftypes = {
					"terminal",
				},
			},
			components = {
				{ "mode", {
					timing = false,
				} },
				{
					name = "os-uname",
					user_event = { "VeryLazy" },
					colors = {
						fg = colors.green,
					},
					configs = {
						icons = {
							mac = "",
							linux = "",
							windows = "",
						},
					},
					update = function(configs)
						local os_uname = uv.os_uname()

						local uname = os_uname.sysname
						if uname == "Darwin" then
							return { { configs.icons.mac, { fg = colors.white } } }
						elseif uname == "Linux" then
							if os_uname.release:find("arch") then
								return { { "", { fg = colors.blue } } }
							end
							return { { configs.icons.linux, { fg = colors.yellow } } }
						elseif uname == "Windows_NT" then
							return { { configs.icons.windows, { fg = colors.blue } } }
						else
							return uname or "󱚟 Unknown OS"
						end
					end,
				},
				"filename",
				"git-branch",
				"git-diff",
				"%=",
				"diagnostics",
				"lsps-formatters",
				"indent",
				{
					name = "encoding",
					update_group = "BUF_WIN_ENTER",
					configs = {
						["utf-8"] = "󰉿",
						["utf-16"] = "󰊀",
						["utf-32"] = "󰊁",
						["utf-8mb4"] = "󰊂",
						["utf-16le"] = "󰊃",
						["utf-16be"] = "󰊄",
					},
					colors = { fg = colors.yellow }, -- { fg = colors.black, bg = colors.white }
					update = function(configs)
						local enc = vim.bo.fenc ~= "" and vim.bo.fenc or vim.o.enc
						return configs[enc] or enc or ""
					end,
				},
				"pos-cursor",
				"pos-cursor-progress",
			},
		})
	end,
}
