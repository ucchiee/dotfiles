local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
  config.font = wezterm.font_with_fallback({
    { family = "JetBrainsMono Nerd Font Mono", weight = "DemiBold" },
    { family = "Hiragino Sans", weight = "DemiBold" },
  })
  config.font_size = 14
end

return module
