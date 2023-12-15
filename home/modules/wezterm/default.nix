{ specialArgs, ... }: {
  programs.wezterm = {
    enable = specialArgs.withGUI;
    enableZshIntegration = true;
  };

  xdg.configFile."wezterm/wezterm.lua" = {
    source = ./wezterm.lua;
  };
}
