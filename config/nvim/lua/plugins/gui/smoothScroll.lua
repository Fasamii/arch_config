return 	{
		"karb94/neoscroll.nvim",
		fuzy = false,
		config = function()
			require("neoscroll").setup({
				hide_cursor = false,          -- Hide cursor while scrolling
				stop_eof = true,             -- Stop at <EOF> when scrolling downwards
				respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
				cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
				duration_multiplier = 0.8,   -- Global duration multiplier
			  	easing = 'linear',           -- Default easing function

				-- for hiding scrollbar because it jumps on scroll
				pre_hook = function()
					if require("scrollbar") then
						require("scrollbar").clear();
					end;
				end,
				post_hook = function() 
					if not require("scrollbar") then
						require("scrollbar").setup();
					end
				end,

				performance_mode = false,
				ignored_events = {  
					'WinScrolled', 'CursorMoved'
				},
			});
		end,
}
