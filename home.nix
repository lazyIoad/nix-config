{ config, pkgs, ... }:

{
  home.username = "lazyload";
  home.homeDirectory = "/home/lazyload";

  home.stateVersion = "23.11";

  programs.home-manager.enable = true;
}
