-- ~/.wezterm.lua

local wezterm = require("wezterm")
local config = wezterm.config_builder()
local mux = wezterm.mux

-- Keep tabs invisible in fullscreen
config.show_tabs_in_tab_bar = false
config.hide_tab_bar_if_only_one_tab = true
config.window_decorations = "RESIZE"
config.enable_tab_bar = false

config.native_macos_fullscreen_mode = true

wezterm.on('gui-startup', function(cmd)
  local tab, pane, window = mux.spawn_window(cmd or {})
  window:gui_window():maximize()
  window:gui_window():toggle_fullscreen()
end)

-- Disable all default key bindings for a clean slate
config.disable_default_key_bindings = true

-- Set Nushell as the default shell
config.default_prog = {
--  "/opt/homebrew/bin/nu", "--login",
--  "--config", "~/library/application support/nushell/config.nu"
	"/bin/zsh"
}

config.set_environment_variables = {
	PATH = "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin",
	EDITOR = "nvim",
}

config.background = {
  {
    source = { File = os.getenv("HOME") .. '/.config/hotline-miami/hotline-miami.jpg' },
    hsb = { brightness = 0.2, saturation = 0.8 },
    height = 'Cover',
    width = 'Cover',
  },
}

config.color_scheme = "Miami Hotline"

config.color_schemes = {
	["Miami Hotline"] = {
		foreground = "#d7fffe", -- bright near-white cyan
		background = "#f765b8",--"#0a0018", -- deep night backdrop
		cursor_bg = "#27fdf5",
		cursor_border = "#27fdf5",
		cursor_fg = "#0a0018",

		selection_bg = "#f98dc9",
		selection_fg = "#0a0018",

		-- ANSI colors tuned to neon vibe
		-- black, red, green, yellow, blue, magenta, cyan, white
		ansi = {
			"#0a0018", -- black (really dark violet)
			"#f765b8", -- red -> neon pink
			"#27fdf5", -- green -> teal/cyan (Miami swap)
			"#a8f6f8", -- yellow -> light cyan
			"#6a5cff", -- blue -> electric indigo accent
			"#f98dc9", -- magenta -> bubblegum pink
			"#27fdf5", -- cyan
			"#d7fffe", -- white -> near-white cyan
		},
		brights = {
			"#1a0a2a", -- bright black
			"#ff78c6", -- bright red -> hotter pink
			"#6efef6", -- bright green -> brighter cyan
			"#d7fffe", -- bright yellow -> near-white cyan
			"#8a7aff", -- bright blue
			"#ff9bd7", -- bright magenta
			"#a8f6f8", -- bright cyan
			"#ffffff", -- bright white
		},

		-- UI accents
		scrollbar_thumb = "#6a5cff",
		split = "#6a5cff",
	},
}
config.keys = {
	-- Zoom in
    	{ key = '=', mods = 'CMD', action = wezterm.action.IncreaseFontSize },
    	-- Zoom out
    	{ key = '-', mods = 'CMD', action = wezterm.action.DecreaseFontSize },
    	-- Reset zoom
    	{ key = '0', mods = 'CMD', action = wezterm.action.ResetFontSize },
  	
	-- Split pane vertically (Cmd+D)
	{
		key = "d",
		mods = "CMD",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	-- Split pane horizontally (Cmd+Shift+D)
	{
		key = "d",
		mods = "CMD|SHIFT",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},

	-- Move between panes (Cmd+Option+Arrow)
	{
		key = "LeftArrow",
		mods = "CMD|OPT",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		key = "RightArrow",
		mods = "CMD|OPT",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		key = "UpArrow",
		mods = "CMD|OPT",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		key = "DownArrow",
		mods = "CMD|OPT",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},

	-- Open new tab (Cmd+t)
	{
		key = "t",
		mods = "CMD",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},

	-- Close current pane (Cmd+Shift+X)
	{
		key = "x",
		mods = "CMD|SHIFT",
		action = wezterm.action.CloseCurrentPane({ confirm = true }),
	},

	-- Close current tab (Cmd+W)
	{
		key = "w",
		mods = "CMD",
		action = wezterm.action.CloseCurrentTab({ confirm = false }),
	},
	-- Move to next tab (Cmd+Shift+])
	{
		key = "]",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivateTabRelative(1),
	},

	{
		key = "[",
		mods = "CMD|SHIFT",
		action = wezterm.action.ActivateTabRelative(-1),
	},

	-- Toggle pane zoom (Cmd+Shift+Z)
	{
		key = "z",
		mods = "CMD|SHIFT",
		action = wezterm.action.TogglePaneZoomState,
	},

	-- Move cursor one word left/right (Option+Left/Right)
--	{
--		key = "LeftArrow",
--		mods = "OPT",
--		action = wezterm.action.SendKey { key = "b", mods = "ALT" }, --("\x1bb"), -- Alt+b
--	},
--	{
--		key = "RightArrow",
--		mods = "OPT",
--		action = wezterm.action.SendKey { key = "f", mods = "ALT" },
--	},

	-- Cmd+Left: Beginning of line (Ctrl+A)
--	{
--		key = "LeftArrow",
--		mods = "CMD",
--		action = wezterm.action.SendString("\x01"),
--	},

	-- Cmd+Right: End of line (Ctrl+E)
--	{
--		key = "RightArrow",
--		mods = "CMD",
--		action = wezterm.action.SendString("\x05"),
--	},

	-- Cmd+Up: Beginning of document (Home)
	{
		key = "UpArrow",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "Home" }),
	},

	-- Cmd+Down: End of document (End)
	{
		key = "DownArrow",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "End" }),
	},
	-- Delete word left/right (Option+Delete/Option+Fn+Delete)
	{
		key = "Backspace",
		mods = "OPT",
		action = wezterm.action.SendString("\x17")--("\x1b\x7f"), -- Alt+Backspace
	},
	{
		key = "Delete",
		mods = "OPT",
		action = wezterm.action.SendString("\x1bd"), -- Alt+d
	},

	-- Select all (Cmd+A)
	{
		key = "a",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "a", mods = "CTRL" }), -- Usually handled by shell/editor
	},

	-- Copy/Paste (Cmd+C/Cmd+V)
	{
		key = "c",
		mods = "CMD",
		action = wezterm.action.CopyTo("Clipboard"),
	},
	{
		key = "v",
		mods = "CMD",
		action = wezterm.action.PasteFrom("Clipboard"),
	},

	-- Cut (Cmd+X)
	{
		key = "x",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "x", mods = "CTRL" }), -- Usually handled by shell/editor
	},

	-- Undo (Cmd+Z)
	{
		key = "z",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "z", mods = "CTRL" }), -- Usually handled by shell/editor
	},

	-- Redo (Cmd+Shift+Z)
	{
		key = "Z",
		mods = "CMD|SHIFT",
		action = wezterm.action.SendKey({ key = "z", mods = "CTRL|SHIFT" }), -- Usually handled by shell/editor
	},

	-- Clear line (Cmd+K)
	{
		key = "k",
		mods = "CMD",
		action = wezterm.action.SendKey({ key = "u", mods = "CTRL" }), -- Ctrl+u clears line in most shells
	},
}

return config
