local wezterm = require("wezterm")
local act = wezterm.action

local module = {}

function module.apply_to_config(config)
  config.leader = { key = "t", mods = "CTRL", timeout_milliseconds = 1000 }
  config.keys = {
    -- moving between tabs
    { key = "h", mods = "ALT|CTRL", action = act.ActivateTabRelative(-1) },
    { key = "l", mods = "ALT|CTRL", action = act.ActivateTabRelative(1) },
    { key = "0", mods = "CTRL", action = act.ResetFontSize },
    -- leader-related
    {
      key = "t",
      mods = "LEADER|CTRL",
      action = wezterm.action.SendString("\x14"),
    },
    -- copy mode
    { key = "[", mods = "LEADER", action = act.ActivateCopyMode },
    -- quick select
    { key = "y", mods = "LEADER", action = act.QuickSelect },
    -- panes
    {
      key = "-",
      mods = "LEADER",
      action = act.SplitVertical({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "|",
      mods = "LEADER|SHIFT",
      action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }),
    },
    {
      key = "h",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Left"),
    },
    {
      key = "l",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Right"),
    },
    {
      key = "k",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Up"),
    },
    {
      key = "j",
      mods = "LEADER",
      action = act.ActivatePaneDirection("Down"),
    },
  }
end

return module
