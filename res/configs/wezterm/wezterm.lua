local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font 'IBM Plex Mono'
config.font_size = 13
config.line_height = 1

function scheme_for_appearance(appearance)
  if appearance:find "Dark" then
    return "Catppuccin Mocha"
  else
    return "Catppuccin Latte"
  end
end

config.color_scheme = scheme_for_appearance(wezterm.gui.get_appearance())
config.enable_tab_bar = false
config.window_decorations = 'RESIZE'

config.keys = {
  {
    key = "P",
    mods = "SUPER|SHIFT",
    action = act.ActivateCommandPalette,
  },
  {
    key = '"',
    mods = "SUPER|SHIFT",
    action = act.SplitVertical,
  },
  {
    key = "Enter",
    mods = "SUPER|SHIFT",
    action = act.SplitHorizontal,
  },
  {
    key = "K",
    mods = "CTRL|SHIFT",
    action = act.Multiple {
      act.ClearScrollback "ScrollbackAndViewport",
      act.SendKey { key = "L", mods = "CTRL" },
    },
  },
  {
    key = "1",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(0),
  },
  {
    key = "2",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(1),
  },
  {
    key = "3",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(2),
  },
  {
    key = "4",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(3),
  },
  {
    key = "5",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(4),
  },

  {
    key = "6",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(5),
  },

  {
    key = "7",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(6),
  },

  {
    key = "8",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(7),
  },
  {
    key = "9",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(8),
  },
  {
    key = "0",
    mods = "SUPER",
    action = act.ActivatePaneByIndex(9),
  },
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = act.SendKey { key = 'b', mods = 'ALT' },
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = act.SendKey { key = 'f', mods = 'ALT' },
  },
}

return config
