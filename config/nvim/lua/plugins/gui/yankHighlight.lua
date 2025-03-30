return {
	"rachartier/tiny-glimmer.nvim",
	event = "VeryLazy",
	config = function()
		require("tiny-glimmer").setup({
			enabled = true,
			disable_warnings = true,
			default_animation = "pulse",
			refresh_interval_ms = 6,
			overwrite = {
				auto_map = true,
				search = {
					enabled = false,
				},
				paste = {
					enabled = true,
					default_animation = "pulse",
					paste_mapping = "p",
					Paste_mapping = "P",
				},
			},
			support = {},
			presets = {
				pulsar = {
					enabled = false,
				},
			},
			transparency_color = "#000000",
			animations = {
				fade = {
					max_duration = 80,
					min_duration = 30,
					easing = "outQuad",
					chars_for_max_duration = 10,
					from_color = "#804307",
            		to_color = "#502300",
				},
				reverse_fade = {
					max_duration = 380,
					min_duration = 300,
					easing = "outBack",
					chars_for_max_duration = 10,
				},
				bounce = {
					max_duration = 500,
					min_duration = 400,
					chars_for_max_duration = 20,
					oscillation_count = 1,
				},
				left_to_right = {
					max_duration = 350,
					min_duration = 350,
					min_progress = 0.85,
					chars_for_max_duration = 25,
					lingering_time = 50,
				},
				pulse = {
					from_color = "Visual",
					max_duration = 200,
					min_duration = 100,
					chars_for_max_duration = 15,
					pulse_count = 2,
					intensity = 1.8,
				},
			},
		});
	end,
}
