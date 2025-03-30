return {
	"goolord/alpha-nvim",
	dependencies = { 'nvim-tree/nvim-web-devicons' },
	config = function()
		local initCwd = vim.loop.cwd();

		local dashboard = require("alpha.themes.dashboard");

		dashboard.file_icons_provider = "devicons";

		-- buggy part 
		dashboard.opts.layout = {
			-- { type = "padding", val = math.floor(vim.o.lines * 0.2) }, -- Adjust vertical centering
		 	-- dashboard.section.header,
			-- { type = "padding", val = (math.floor((vim.o.lines - 11) / 2)) },
			-- dashboard.section.buttons,
		 	-- { type = "padding", val = (vim.o.lines - (math.floor(vim.o.lines - 11) / 2) - 11) },
		 	-- dashboard.section.footer,
			{ type = "padding", val = math.floor((vim.o.lines - 11) / 2), },
			dashboard.section.buttons,
			{ type = "padding", val = vim.o.lines - math.floor((vim.o.lines - 11) / 2) - 11, },
			dashboard.section.footer,
		};

		dashboard.section.buttons.val = {
			dashboard.button( "e", "󰐖  New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button( "o", "󰈚  Open file", ":Ex<CR>"),
			dashboard.button( "r", "󰛁  Recent files", ":Telescope oldfiles<CR>"),
			dashboard.button( "f", "󰛂  Find file local", function()
				require("telescope.builtin").find_files({ cwd = initCwd });
			end),
			dashboard.button( "g", "󰛍  Find file global", ":cd $HOME/workspace | Telescope find_files<CR>"),
			-- dashboard.button( "s", "󰒔  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
			-- dashboard.button( "q", "󰅗  Quit NVIM", ":qa<CR>"),
		};

		require("alpha").setup(dashboard.opts);
	end,
	--[[
	"startup-nvim/startup.nvim",
	dependencies = {
		"telescope.nvim",
		"plenary.nvim",
	},
	config = function()
		local initCwd = vim.loop.cwd();
		require("startup").setup({
			section_1 = {
				type = "mapping",
				oldfiles_directory = false,
				align = "center",
				fold_section = false,
				title = "test",
				margin = 5,
				-- type of content depends on `type`
				-- "text" -> a table with string or a function that requires a function that returns a table of strings
				-- "mapping" -> a table with tables in the format:
				-- {
				--   {<displayed_command_name>, <command>, <mapping>}
				--   {<displayed_command_name>, <command>, <mapping>}
				-- }
				-- e.g. {" Find File", "Telescope find_files", "<leader>ff" }
				-- "oldfiles" -> ""
				content = {
					{"hello", ":Mason", "<leader>l"},
					{"hello2", ":Telescope find_file", "<leader>r"},
					{
						"Find Files Local",
						function()
							require("telescope.builtin").find_files({ cwd = initCwd });
						end,
						"<leader>f"
					},
				},
				highlight = "String", -- highlight group in which the section text should be highlighted
				default_color = "#FF0000", -- a hex color that gets used if you don't specify `highlight`
				oldfiles_amount = 5, -- the amount of oldfiles to be displayed
			},
			 options = {
				  mapping_keys = true,
				  cursor_column = 0.5,

				  after = function()
					  print("yay");
				  end,
				  empty_lines_between_mappings = true,
				  disable_statuslines = true,
				  paddings = {1,2},
			  },
			  mappings = {
				execute_command = "<CR>",
				open_file = "o",
				open_file_split = "<c-o>",
				open_section = "<TAB>",
				open_help = "?",
			  },
			  colors = {
				background = "#1f2227",
				folded_section = "#56b6c2", 
			  },
			  parts = {"section_1"} -- all sections in order
		});
	end,
	]]--
}
