{ config, specialArgs, ... }: {
  programs.wezterm = {
    enable = specialArgs.withGUI;
    enableZshIntegration = true;
  };

  xdg.configFile."wezterm".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/workspace/dots/res/configs/wezterm";
}
