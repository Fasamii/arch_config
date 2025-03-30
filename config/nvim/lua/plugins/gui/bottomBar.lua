return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = require("config.settings").theme,
				theme = "auto",
				component_separators = { left = "", right = ""},

				section_separators = { left = "┃", right = "┃"},
				-- section_separators = { left = "◣", right = "◥"},
				-- section_separators = { left = "◣", right = "◢"},
				-- section_separators = { left = "◗", right = ""},
				-- section_separators = { left = "", right = "󰉆"},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
					"alpha",
				},
			},

			ignore_focus = {},
			always_divide_middle = true,
			always_show_tabline = true,
			globalstatus = false,
			refresh = {
				statusline = 100,
				tabline = 100,
				winbar = 100,
			},

			sections = {
				lualine_a = {
					{
						"mode",
						icons_enabled = false,
						draw_empty = true,
						padding = 1,
						fmt = function(str, obj)
							return string.sub(str, 1, 1);
						end,
						on_click = function(clicksCount, btn, mod)
							print("haiiii :3");
						end,
					},
				},
				lualine_b = {
					"diagnostics",
					{
						-- ctrl - l <- to disable search
						"searchcount",
						maxcount = 999,
						timeout = 1,
					},
					"branch",
					{
						"diff",
						colored = true,
						symbols = {
							added = "+",
							modified = "~",
							removed = "-",
							source = false,
						},
					},
				},
				lualine_c = {
					{
						"filename",
						file_status = true,
						newfile_status = true,
						path = 4,
						symbols = {
							modified = "󰏬 ",
							readonly = "󰿋 ",
							unnamed = "no name",
							newfile = "󰐖 ",
						},
					},
				},

				lualine_x = {
					{
						"filetype",
						colored = true,
						icon_only = false,
						icon = { align = "left" },
						filetype_names = {
							alpha = "menu",
						},
					},
				},
				lualine_y = {
					{
						"encoding",
						show_bomb = false,
					},
				},
				lualine_z = {
					{
						"location",
						padding = { left = 1, right = 1},
					},
				},
			},

			inactive_sections = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = {"filename"},
				lualine_x = {"filetype"},
				lualine_y = {"encoding"},
				lualine_z = {}
			},

			tabline = {},
			winbar = {},
			inactive_winbar = {},
			extensions = {},
		})
	end,
}
