-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Gruvbox Dark (Gogh)"

config.enable_tab_bar = false
config.font_size = 13
config.window_background_opacity = 0.95
config.window_decorations = "NONE"
config.window_padding = {
	left = 5,
	right = 0,
	top = 10,
	bottom = 0,
}

-- and finally, return the configuration to wezterm
return config
