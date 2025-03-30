return {
	"nacro90/numb.nvim",
	config = function()
		require('numb').setup{
		  show_numbers = true,
		  show_cursorline = true,
		  hide_relativenumbers = true,
		  number_only = false, -- Peek only when the command is only a number instead of when it starts with a number
		  centered_peeking = true,
		};
	end,
}
