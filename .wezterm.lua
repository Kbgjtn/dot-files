local wezterm = require("wezterm")
local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- settings
config.font = wezterm.font_with_fallback({
	family = "FiraCode Nerd Font",
	weight = "DemiBold",
	stretch = "Normal",
	italic = false,
	style = "Normal",
	scale = 1.2,
})
config.font_size = 16.0
config.color_scheme = "Batman"
config.window_background_opacity = 0.95
config.window_decorations = "RESIZE"
config.window_close_confirmation = "AlwaysPrompt"
config.scrollback_lines = 3000
config.default_workspace = "home"
config.enable_scroll_bar = false
config.min_scroll_bar_height = "2cell"
config.window_frame = {
	font = wezterm.font({ family = "FiraCode Nerd Font", weight = "DemiBold", italic = false, style = "Normal" }),
	font_size = 14,
	active_titlebar_bg = "#191919",
	inactive_titlebar_bg = "#333333",
}
config.initial_cols = 68
config.initial_rows = 18
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}

config.hide_tab_bar_if_only_one_tab = false
config.default_cursor_style = "BlinkingBar"
config.use_fancy_tab_bar = false
config.status_update_interval = 1000

config.inactive_pane_hsb = {
	saturation = 0.25,
	brightness = 0.5,
}
config.colors = {
	scrollbar_thumb = "#303030",
	tab_bar = {
		-- The color of the inactive tab bar edge/divider
		inactive_tab_edge = "#202020",
		inactive_tab = {
			bg_color = "#202020",
			fg_color = "#f3f3f3",
		},

		new_tab = {
			bg_color = "#202020",
			fg_color = "#808080",

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab`.
		},

		-- You can configure some alternate styling when the mouse pointer
		-- moves over the new tab button
		new_tab_hover = {
			bg_color = "#202020",
			fg_color = "#f3f3f3",
			italic = true,

			-- The same options that were listed under the `active_tab` section above
			-- can also be used for `new_tab_hover`.
		},
	},
}

local mux = wezterm.mux
local act = wezterm.action

-- keys
config.keys = {}

config.disable_default_key_bindings = true
config.leader = { key = "b", mods = "CTRL", timeout_milliseconds = 2000 }

config.keys = {
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "Tab", mods = "CTRL|SHIFT", action = act.ActivateTabRelative(-1) },
	{ key = "j", mods = "CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "k", mods = "CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "Enter", mods = "CTRL", action = act.ActivateCopyMode },
	{ key = "R", mods = "SHIFT|CTRL", action = act.ReloadConfiguration },
	{ key = "+", mods = "CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "CTRL", action = act.DecreaseFontSize },
	{ key = "0", mods = "CTRL", action = act.ResetFontSize },
	{ key = "C", mods = "SHIFT|CTRL", action = act.CopyTo("Clipboard") },
	{ key = "N", mods = "SHIFT|CTRL", action = act.SpawnWindow },
	{
		key = "U",
		mods = "SHIFT|CTRL",
		action = act.CharSelect({ copy_on_select = true, copy_to = "ClipboardAndPrimarySelection" }),
	},
	{ key = "v", mods = "CTRL", action = act.PasteFrom("Clipboard") },
	{ key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "LeftArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "SHIFT|CTRL", action = act.ActivatePaneDirection("Down") },
	{ key = "V", mods = "CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "H", mods = "CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "[", mods = "CTRL", action = act.ActivatePaneDirection("Left") },
	{ key = "]", mods = "CTRL", action = act.ActivatePaneDirection("Right") },
	{ key = "t", mods = "CTRL", action = act.SpawnTab("CurrentPaneDomain") },
	-- { key = "w", mods = "CTRL", action = act.CloseCurrentTab({ confirm = true }) },
	{ key = "x", mods = "CTRL", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "b", mods = "LEADER|CTRL", action = act.SendString("\x02") },
	{ key = "Enter", mods = "LEADER", action = act.ActivateCopyMode },
	{
		key = "k",
		mods = "CTRL|ALT",
		action = act.Multiple({
			act.ClearScrollback("ScrollbackAndViewport"),
			act.SendKey({ key = "L", mods = "CTRL" }),
		}),
	},
	{ key = "r", mods = "LEADER", action = act.ActivateKeyTable({ name = "resize_pane", one_shot = false }) },
}

return config
