local module = {}

function module.apply_to_config(config)
  -- Tab
  config.hide_tab_bar_if_only_one_tab = true

  -- Window
  config.window_frame = {
    -- border
    border_left_width = "0.2cell",
    border_right_width = "0.2cell",
    border_bottom_height = "0.1cell",
    border_top_height = "0.1cell",
    border_left_color = "#625a54",
    border_right_color = "#625a54",
    border_bottom_color = "#625a54",
    border_top_color = "#625a54",
  }
  -- no title bar
  config.window_decorations = "RESIZE"
  -- padding
  config.window_padding = {
    left = 2,
    right = 2,
    top = 2,
    bottom = 0,
  }
  -- opacity
  config.window_background_opacity = 0.6
  config.text_background_opacity = 0.5
end

return module
