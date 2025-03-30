return {
	"catppuccin/nvim",
	lazy = false,
	priority = 1000,
	name = "catppuccin",
	config = function()
		require("catppuccin").setup({
			show_end_of_buffer = false,
			default_integrations = true,
			integrations = {
				treesitter = true,
				alpha = true,
			},

			transparent_background = true,
			term_colors = true,
			no_italic = false,
			no_bold = false,
			no_underline = false,

			styles = {
				comments = { "italic" },
				conditionals = {},
				loops = {},
				functions = {},
				keywords = {},
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = { "bold" },
				operators = {},
			},
			color_overrides = {
				mocha = {
					mantle = "#000000",
					crust = "#000000",
				},
			},
		});
		vim.cmd.colorscheme("catppuccin-mocha");
	end,
}
