local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- determine which OS is running
-- local getOS = {}

function getOS()
	local osname
	-- ask LuaJIT first
	if jit then
		return jit.os
	end

	-- Unix, Linux variants
	local fh, err = assert(io.popen("uname -o 2>/dev/null", "r"))
	if fh then
		osname = fh:read()
	end

	return osname or "Windows"
end

-- This is where you actually apply your config choices
config = {
	color_scheme = "catppuccin-mocha", -- color scheme:
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	enable_tab_bar = false,
	-- window_decorations = "RESIZE",
}

print("This will be the OS debug printout")

if getOS() == "Windows" then
	config.default_domain = "WSL:Ubuntu-22.04"
end

config.font = wezterm.font_with_fallback({
	{ family = "CaskaydiaCove Nerd Font Mono", weight = "Bold" },
	"JetBrains Mono",
	"Fira Code",
})

config.window_background_opacity = 0.9

-- and finally, return the configuration to wezterm
return config
