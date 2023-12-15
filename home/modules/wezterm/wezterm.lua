local wezterm = require 'wezterm'
local act = wezterm.action

local config = {}

if wezterm.config_builder then
  config = wezterm.config_builder()
end

config.font = wezterm.font 'FiraCode Nerd Font Mono'
config.font_size = 13
config.line_height = 1.1

config.color_scheme = 'Gruvbox dark, hard (base16)'

config.use_fancy_tab_bar = false
config.window_decorations = 'RESIZE'

config.keys = {
  {
    key = "p",
    mods = "SUPER|SHIFT",
    action = act.ActivateCommandPalette,
  },
  {
    key = "Enter",
    mods = "SUPER",
    action = act.SplitVertical,
  },
  {
    key = "Enter",
    mods = "SUPER|SHIFT",
    action = act.SplitHorizontal,
  },
  {
    key = "k",
    mods = "SUPER",
    action = act.ClearScrollback "ScrollbackAndViewport",
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

-- nvim zen-mode integration
wezterm.on('user-var-changed', function(window, pane, name, value)
    local overrides = window:get_config_overrides() or {}
    if name == "ZEN_MODE" then
        local incremental = value:find("+")
        local number_value = tonumber(value)
        if incremental ~= nil then
            while (number_value > 0) do
                window:perform_action(wezterm.action.IncreaseFontSize, pane)
                number_value = number_value - 1
            end
            overrides.enable_tab_bar = false
        elseif number_value < 0 then
            window:perform_action(wezterm.action.ResetFontSize, pane)
            overrides.font_size = nil
            overrides.enable_tab_bar = true
        else
            overrides.font_size = number_value
            overrides.enable_tab_bar = false
        end
    end
    window:set_config_overrides(overrides)
end)

return config
