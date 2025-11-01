-- Pull in the wezterm API
local wezterm = require("wezterm")

-- Hold the configuration
local config = wezterm.config_builder()

config.font = wezterm.font("MesloLGL Nerd Font")
config.font_size = 13

config.enable_tab_bar = false

config.window_decorations = "RESIZE"

-- config.color_scheme = "Catppuccin Macchiato"
config.color_scheme = "Catppuccin Mocha"

-- config.window_background_opacity = 0.95

config.default_prog = {
	"wsl",
	"-d",
	"Debian",
	"--exec",
	"zsh",
}

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = wezterm.mux.spawn_window(cmd or {})
	window:gui_window():toggle_fullscreen()
end)

return config
