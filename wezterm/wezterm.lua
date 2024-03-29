local wezterm = require("wezterm")

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

require("general").apply_to_config(config)
require("font").apply_to_config(config)
require("colorscheme").apply_to_config(config)
require("window").apply_to_config(config)
require("pane").apply_to_config(config)
require("events").apply_to_config(config)
require("bindings").apply_to_config(config)
require("hyperlink").apply_to_config(config)

return config
