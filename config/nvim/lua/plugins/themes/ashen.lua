return {
	"ashen-org/ashen.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("ashen").setup({
			style = {
				bold = true,
				italic = true,
			},
			style_presets = {
				bold_functions = true,
				italic_comments = true,
			},
		});
		vim.cmd("colorscheme ashen");
	end,
}
