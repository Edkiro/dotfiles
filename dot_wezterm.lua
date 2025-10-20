-- ~/.wezterm.lua

local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- Disable all default key bindings for a clean slate
config.disable_default_key_bindings = true

-- Set Nushell as the default shell
config.default_prog = { '/opt/homebrew/bin/nu' }
config.set_environment_variables = {
  PATH = "/opt/homebrew/bin:/usr/local/bin:/usr/bin:/bin",
  EDITOR = 'code',
}

config.keys = {
    -- Split pane vertically (Cmd+D)
  {
    key = 'd',
    mods = 'CMD',
    action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' },
  },
  -- Split pane horizontally (Cmd+Shift+D)
  {
    key = 'd',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },

  -- Move between panes (Cmd+Option+Arrow)
  {
    key = 'LeftArrow',
    mods = 'CMD|OPT',
    action = wezterm.action.ActivatePaneDirection 'Left',
  },
  {
    key = 'RightArrow',
    mods = 'CMD|OPT',
    action = wezterm.action.ActivatePaneDirection 'Right',
  },
  {
    key = 'UpArrow',
    mods = 'CMD|OPT',
    action = wezterm.action.ActivatePaneDirection 'Up',
  },
  {
    key = 'DownArrow',
    mods = 'CMD|OPT',
    action = wezterm.action.ActivatePaneDirection 'Down',
  },

  -- Open new tab (Cmd+t)
  {
    key = 't',
    mods = 'CMD',
    action = wezterm.action.SpawnTab 'CurrentPaneDomain',
  },

  -- Close current pane (Cmd+Shift+X)
  {
    key = 'x',
    mods = 'CMD|SHIFT',
    action = wezterm.action.CloseCurrentPane { confirm = true },
  },

  -- Close current tab (Cmd+W)  
  {
    key = "w",
    mods = "CMD",
    action = wezterm.action.CloseCurrentTab { confirm = false },
  },

  -- Toggle pane zoom (Cmd+Shift+Z)
  {
    key = 'z',
    mods = 'CMD|SHIFT',
    action = wezterm.action.TogglePaneZoomState,
  },
  
  -- Move cursor one word left/right (Option+Left/Right)
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bb', -- Alt+b
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bf', -- Alt+f
  },

  -- Cmd+Left: Beginning of line (Ctrl+A)
  {
    key = 'LeftArrow',
    mods = 'CMD',
    action = wezterm.action.SendString '\x01',
  },

  -- Cmd+Right: End of line (Ctrl+E)
  {
    key = 'RightArrow',
    mods = 'CMD',
    action = wezterm.action.SendString '\x05',
  },

  -- Cmd+Up: Beginning of document (Home)
  {
    key = 'UpArrow',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'Home' },
  },

  -- Cmd+Down: End of document (End)
  {
    key = 'DownArrow',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'End' },
  },
  -- Delete word left/right (Option+Delete/Option+Fn+Delete)
  {
    key = 'Backspace',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1b\x7f', -- Alt+Backspace
  },
  {
    key = 'Delete',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bd', -- Alt+d
  },
  
-- Select all (Cmd+A)
  {
    key = 'a',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'a', mods = 'CTRL' }, -- Usually handled by shell/editor
  },

  -- Copy/Paste (Cmd+C/Cmd+V)
  {
    key = 'c',
    mods = 'CMD',
    action = wezterm.action.CopyTo 'Clipboard',
  },
  {
    key = 'v',
    mods = 'CMD',
    action = wezterm.action.PasteFrom 'Clipboard',
  },

  -- Cut (Cmd+X)
  {
    key = 'x',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'x', mods = 'CTRL' }, -- Usually handled by shell/editor
  },

  -- Undo (Cmd+Z)
  {
    key = 'z',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'z', mods = 'CTRL' }, -- Usually handled by shell/editor
  },

  -- Redo (Cmd+Shift+Z)
  {
    key = 'Z',
    mods = 'CMD|SHIFT',
    action = wezterm.action.SendKey { key = 'z', mods = 'CTRL|SHIFT' }, -- Usually handled by shell/editor
  },

  -- Clear line (Cmd+K)
  {
    key = 'k',
    mods = 'CMD',
    action = wezterm.action.SendKey { key = 'u', mods = 'CTRL' }, -- Ctrl+u clears line in most shells
  },
}

return config

