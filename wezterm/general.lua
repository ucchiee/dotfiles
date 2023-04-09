local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	config.ssh_domains = wezterm.default_ssh_domains()
	for _, dom in ipairs(config.ssh_domains) do
		dom.assume_shell = "Posix"
	end
end

return module
