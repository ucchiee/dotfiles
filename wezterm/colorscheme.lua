local module = {}

function module.apply_to_config(config)
  --[[ config.color_scheme = "gruvbox-material" ]]
  --[[ config.color_scheme = 'Gruvbox Material (Gogh)' ]]
  require("colors.kanagawa").apply_to_config(config)
end

return module
