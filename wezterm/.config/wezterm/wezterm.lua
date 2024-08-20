local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
config = {
	color_scheme = "AdventureTime", -- color scheme:
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	enable_tab_bar = false,
	-- window_decorations = "RESIZE",
}
-- and finally, return the configuration to wezterm
return config
