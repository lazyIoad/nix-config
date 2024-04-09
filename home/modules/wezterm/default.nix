{ lib, config, pkgs, specialArgs, ... }:
let
  cfg = config.programs.wezterm-config;
in
{
  options.programs.wezterm-config = {
    enable = lib.mkOption {
      type = lib.types.bool;
      default = config.programs.wezterm.enable;
      description = "Whether to enable Wezterm dotfiles";
    };
  };
} // {
  config = lib.mkIf cfg.enable {
    xdg.configFile."wezterm".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/workspace/dotfiles/wezterm";

    xdg.configFile."wezterm/wezterm.lua".enable = false;
  };
}
