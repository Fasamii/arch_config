return {
	"petertriho/nvim-scrollbar",
	lazy = false,
	config = function()
		require("scrollbar").setup({
			hide_if_all_visible = true,
			handle = {
				text = " ",
				blend = 80,
				color = "#ffffff",
				color_nr = nil,
				hide_if_all_visible = true,
			},
			marks = {
				Cursor = {
					text = "•",
					priority = 0,
					gui = nil,
					color = "#ffffff",
					color_nr = nil,
				},	
				Search = {
					text = { "-", "=" },
            		priority = 1,
            		gui = nil,
					color = "#14adff",
            		color_nr = nil,
				},
				Error = {
					text = { "-", "=" },
            		priority = 2,
            		gui = nil,
					color =  "#f70057",
					color_nr = nil,
				},
				Warn = {
					text = { "-", "=" },
            		priority = 3,
            		gui = nil,
					color =  "#f7a307",
					color_nr = nil,
				},
				Info = {
					text = { "-", "=" },
            		priority = 4,
            		gui = nil,
					color = "#008cff",
					color_nr = nil,
				},
				Hint = {
					text = { "-", "=" },
            		priority = 5,
            		gui = nil,
					color = "#14ffa1",
					color_nr = nil,
				 },
				Misc = {
					text = { "-", "=" },
            		priority = 6,
            		gui = nil,
					color = "#cb1adb",
					color_nr = nil,
				},
				GitAdd = {
					text = "┆",
					priority = 7,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "GitSignsAdd",
				},
				GitChange = {
					text = "┆",
					priority = 7,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "GitSignsChange",
				},
				GitDelete = {
					text = "▁",
					priority = 7,
					gui = nil,
					color = nil,
					cterm = nil,
					color_nr = nil, -- cterm
					highlight = "GitSignsDelete",
				},
			},
			
    		excluded_buftypes = {
        		"terminal",
				"alpha",
    		},
			excluded_filetypes = {
				"dropbar_menu",
				"dropbar_menu_fzf",
				"DressingInput",
				"cmp_docs",
				"cmp_menu",
				"noice",
				"prompt",
				"TelescopePrompt",
				"alpha"
			},

			autocmd = {
				render = {
					"BufWinEnter",
					"TabEnter",
					"TermEnter",
					"WinEnter",
					"CmdwinLeave",
					"TextChanged",
					"VimResized",
					"WinScrolled",
				},
				clear = {
					"BufWinLeave",
					"TabLeave",
					"TermLeave",
					"WinLeave",
				},
			},

			handlers = {
				cutsor = true,
				diagnostic = true,
				gitsigns = false,
				handle = true,
				search = false,
				ale = false,
			},

			-- example -- 
			--[[
			require("scrollbar.handlers").register("my_marks", function(bufnr)
				return {
					{ line = 5, type = "Error" },
					-- { line = 6, level = 2 },
					-- { line = 4, text = "]", type = "Warn" },
					{ line = 4, type = "Error" },
				}
			end), 
			]]--
		});
	end,
}
