local wezterm = require("wezterm")
local act = wezterm.action
local co = wezterm.color.parse

local color_scheme = "Catppuccin Latte"
local scheme = wezterm.color.get_builtin_schemes()[color_scheme]

local ssh_domains = {}
for host, _ in pairs(wezterm.enumerate_ssh_hosts()) do
	if host ~= "local" then
		table.insert(ssh_domains, {
			-- the name can be anything you want; we're just using the hostname
			name = host,
			-- remote_address must be set to `host` for the ssh config to apply to it
			remote_address = host,

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
end

wezterm.on("window-config-reloaded", function(window, _)
	window:toast_notification("wezterm", "configuration reloaded", nil, 4000)
end)

wezterm.on("format-tab-title", function(tab, _, _, _, _, _)
	local title = tab.tab_title
	if not title or #title == 0 then
		title = tab.active_pane.title
	end
	local bg
	if tab.is_active then
		bg = co(scheme.background)
	else
		bg = co(scheme.background):darken(0.1)
	end
	local index = tab.tab_index
	local text = " " .. index + 1 .. ": " .. title .. " "
	return {
		{ Background = { Color = bg } },
		{ Foreground = { Color = scheme.tab_bar.inactive_tab.fg_color } },
		{ Text = text },
	}
end)

local config = {
	color_scheme = color_scheme,
	colors = {
		tab_bar = {
			inactive_tab_edge = scheme.foreground,
		},
	},
	-- tab_bar = scheme.tab_bar,
	window_frame = {
		font_size = 13.0,
		active_titlebar_bg = scheme.background,
		inactive_titlebar_bg = scheme.background,
	},

	default_cursor_style = "BlinkingBlock",
	cursor_blink_ease_in = "Constant",
	cursor_blink_ease_out = "Constant",
	cursor_blink_rate = 500,
	cursor_thickness = 4,

	use_fancy_tab_bar = false,
	-- hide_tab_bar_if_only_one_tab = true,
	-- tab_bar_at_bottom = true,
	show_new_tab_button_in_tab_bar = false,

	window_padding = {
		left = 0,
		right = 0,
		top = 0,
		bottom = 0,
	},

	font = wezterm.font_with_fallback({
		"Sarasa Mono SC",
		"Cartograph CF",
		"Hack",
		"Hasklig",
		"JetBrains Mono",
		"Victor Mono",
		"Symbols Nerd Font",
	}),
	font_size = 14.0,
	line_height = 1.0,

	ssh_domains = ssh_domains,

	enable_kitty_keyboard = true,
	keys = {
		{ key = "d", mods = "CMD", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
		{ key = "d", mods = "CMD|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
		{ key = "d", mods = "ALT", action = act.SplitHorizontal({ cwd = "~" }) },
		{ key = "d", mods = "ALT|SHIFT", action = act.SplitVertical({ cwd = "~" }) },
		{ key = "t", mods = "CMD", action = act.SpawnCommandInNewTab({ cwd = "~" }) },
		{ key = "t", mods = "CMD|SHIFT", action = act.SpawnTab("CurrentPaneDomain") },
		{ key = "0", mods = "CMD", action = wezterm.action_callback(function(win, _)
			win:maximize()
		end) },
		{ key = "UpArrow", mods = "SHIFT", action = act.ScrollToPrompt(-1) },
		{
			key = "s",
			mods = "CMD|SHIFT",
			action = wezterm.action_callback(function(window, pane)
				local choices = {}
				for _, domain in ipairs(wezterm.mux.all_domains()) do
					table.insert(choices, { label = domain:name() })
				end
				window:perform_action(
					wezterm.action.InputSelector({
						title = "Domains",
						choices = choices,
						fuzzy = true,
						action = wezterm.action_callback(function(_, _, _, label)
							wezterm.mux.spawn_window({ domain = { DomainName = label } })
						end),
					}),
					pane
				)
			end),
		},
		{ key = "Enter", mods = "CMD", action = act.TogglePaneZoomState },
		{ key = "s", mods = "CMD", action = act.QuickSelect },
		{ key = "p", mods = "CMD", action = act.ActivateCopyMode },
		{
			key = "o",
			mods = "CMD",
			action = act.QuickSelectArgs({
				patterns = {
					"https?://\\S+",
				},
				action = wezterm.action_callback(function(window, pane)
					local url = window:get_selection_text_for_pane(pane)
					wezterm.log_info("opening: " .. url)
					wezterm.open_with(url)
				end),
			}),
		},
		{ key = "[", mods = "CMD", action = act.ActivateTabRelativeNoWrap(-1) },
		{ key = "]", mods = "CMD", action = act.ActivateTabRelativeNoWrap(1) },
		{
			key = "i",
			mods = "CMD|SHIFT",
			action = act.PromptInputLine({
				description = "Enter new name for tab",
				action = wezterm.action_callback(function(window, _, line)
					-- line will be `nil` if they hit escape without entering anything
					-- An empty string if they just hit enter
					-- Or the actual line of text they wrote
					if line then
						window:active_tab():set_title(line)
					end
				end),
			}),
		},
	},
}

config.quick_select_patterns = {
	"\\b[a-z0-9]+(?:\\-[a-z0-9]+)+\\b", -- looking like kubernetes resource
}

local vim_map = { ["h"] = "Left", ["j"] = "Down", ["k"] = "Up", ["l"] = "Right" }
for k, v in pairs(vim_map) do
	table.insert(config.keys, {
		key = k,
		mods = "CMD",
		action = wezterm.action.ActivatePaneDirection(v),
	})
end

return config
