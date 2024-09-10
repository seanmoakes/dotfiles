local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- determine which OS is running
-- local getOS = {}

function getOS()
	local osname
	-- ask LuaJIT first
	if jit then
		print(jit.os)
		return jit.os
	end

	-- Unix, Linux variants
	local fh, err = assert(io.popen("uname -o 2>/dev/null", "r"))
	if fh then
		osname = fh:read()
	end

	return osname or "Windows"
end

-- OS independent Settings
config = {
	color_scheme = "catppuccin-mocha", -- color scheme:
	automatically_reload_config = true,
	window_close_confirmation = "NeverPrompt",
	enable_tab_bar = false,
	window_background_opacity = 0.9,
}

if getOS() == "Windows" then
	-- WSL
	config.default_domain = "WSL:Ubuntu-22.04"
elseif wezterm.target_triple == "aarch64-apple-darwin" then
	-- MacOS Apple Silicon
	config.window_decorations = "RESIZE"
end

config.font = wezterm.font_with_fallback({
	{ family = "Operator Mono SSm Lig", weight = 400, stretch = "Normal", style = "Normal" },
	"JetBrains Mono",
})

return config
