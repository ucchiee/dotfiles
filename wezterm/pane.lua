local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.pane_focus_follows_mouse = true
end

return module
