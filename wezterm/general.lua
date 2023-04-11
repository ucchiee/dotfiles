local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(config)
	local ssh_domains = {}

	for host, ssh_config in pairs(wezterm.enumerate_ssh_hosts()) do
		table.insert(ssh_domains, {
			-- the name can be anything you want; we're just using the hostname
			name = host,
			-- remote_address must be set to `host` for the ssh config to apply to it
			remote_address = ssh_config.hostname .. ":" .. ssh_config.port,

			username = ssh_config.user,

			ssh_option = {
				identityfile = ssh_config.identityfile,
			},

			remote_wezterm_path = "/home/" .. ssh_config.user .. "/bin/wezterm",

			-- if you don't have wezterm's mux server installed on the remote
			-- host, you may wish to set multiplexing = "None" to use a direct
			-- ssh connection that supports multiple panes/tabs which will close
			-- when the connection is dropped.

			-- multiplexing = "None",

			-- if you know that the remote host has a posix/unix environment,
			-- setting assume_shell = "Posix" will result in new panes respecting
			-- the remote current directory when multiplexing = "None".
			assume_shell = "Posix",
		})
	end

	config.ssh_domains = ssh_domains

	config.adjust_window_size_when_changing_font_size = false
end

return module
