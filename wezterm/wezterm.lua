-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = "Gruvbox dark, soft (base16)"

config.font = wezterm.font("JetBrainsMono Nerd Font Mono", { weight = "DemiBold" })
config.font_size = 14

config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
  border_left_width = "0.2cell",
  border_right_width = "0.2cell",
  border_bottom_height = "0.1cell",
  border_top_height = "0.1cell",
  border_left_color = "purple",
  border_right_color = "purple",
  border_bottom_color = "purple",
  border_top_color = "purple",
}
config.window_background_opacity = 0.6
config.text_background_opacity = 0.5
config.window_decorations = "RESIZE"
config.window_padding = {
  left = 2,
  right = 2,
  top = 2,
  bottom = 0,
}

config.keys = {
  { key = "h", mods = "ALT|CTRL", action = act.ActivateTabRelative(-1) },
  { key = "l", mods = "ALT|CTRL", action = act.ActivateTabRelative(1) },
}

-- and finally, return the configuration to wezterm
return config
