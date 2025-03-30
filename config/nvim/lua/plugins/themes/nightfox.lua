return {
	"EdenEast/nightfox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		local nightfox = require("nightfox");
		nightfox.setup({
			options = {
				transparent = true,
				terminal_colors = true,
				transparent = true,
				styles = {
					comments = "italic",

					keywords = "bold",
					functions = "bold",

					conditionals = "NONE",
					operators = "NONE",

					types = "italic,bold",
					variables = "NONE",
					constants = "bold",

					numbers = "NONE",
					strings = "NONE",
				},
			},
		})
		vim.cmd.colorscheme("carbonfox")
	end,
}
