{ specialArgs, ... }: {
  programs.wezterm.enable = specialArgs.withGUI;
  xdg.configFile."wezterm/wezterm.lua" = {
    source = ./wezterm.lua;
  };
}
