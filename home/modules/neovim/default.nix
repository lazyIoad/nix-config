{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.programs.neovim;
in
{
  config = mkIf cfg.enable
    {
      xdg.configFile."nvim".source =
        config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/workspace/dotfiles/nvim";
      home.packages = [ pkgs.cmake ];
    };

}
