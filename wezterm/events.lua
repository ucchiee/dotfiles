local wezterm = require("wezterm")

local module = {}

function module.apply_to_config(_)
	local function _open_vim_with_text(window, pane, text)
		local name = os.tmpname()
		local f = io.open(name, "w+")
		f:write(text)
		f:flush()
		f:close()
		window:perform_action(
			wezterm.action({ SpawnCommandInNewTab = {
				args = { "vim", name },
			} }),
			pane
		)
		wezterm.sleep_ms(1000)
		os.remove(name)
	end

	wezterm.on("trigger-vim-with-viewport", function(window, pane)
		local viewport = pane:get_lines_as_text()
		_open_vim_with_text(window, pane, viewport)
	end)
	wezterm.on("trigger-vim-with-select", function(window, pane)
		local select = window:get_selection_text_for_pane(pane)
		_open_vim_with_text(window, pane, select)
	end)
end

return module
