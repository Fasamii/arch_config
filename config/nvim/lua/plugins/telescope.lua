return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		{ "nvim-lua/plenary.nvim", },
		{ "nvim-tree/nvim-web-devicons", },
	},
	lazy = false,
  	keys = {
    		{ "<leader>/", false },
    		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files" },
			{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Find Grep" },
			{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Find Help" },
  	},
	config = function()
		require("telescope").setup({
			defaults = {
				border = true,
				color_devicons = true,
				borderchars = {"─","│","─","│","┌","┐","┘","└"},
				prompt_prefix = " ",
				layout_strategy = "flex",
				layout_config = {
					flex = { flip_columns = 100 },
					horizontal = {
						mirror = false,
						prompt_position = "bottom",
						preview_width = 0.55,
					},
					vertical = {
						mirror = false,
					},
					width = 0.85,
					height = 0.92,
					preview_cutoff = 120,
				},
				file_ignore_patterns = {
					"^%.git/",
					"^%.git$",
					"node_modules",
					".cache",
					"build",
				},
				vimgrep_arguments = {
					"rg",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
				},
			},
		});
	end,
}
