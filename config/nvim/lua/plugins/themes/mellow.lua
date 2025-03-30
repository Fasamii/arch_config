return {
	"mellow-theme/mellow.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.mellow_italic_functions = true
		vim.g.mellow_bold_functions = true

		--[[
		vim.g.mellow_highlight_overrides = {
		  ["NormalNC"] = { link = "Normal" }
		}
		]]--

		vim.cmd.colorscheme("mellow");
	end,
}
