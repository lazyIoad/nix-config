{ pkgs, lib, specialArgs, ... }:
let
  inherit (pkgs) stdenv;
  inherit (lib) optionals;
in
{
  imports = [
    ./modules/helix
  ] ++ optionals specialArgs.withGUI [
    ./modules/vscode
    ./modules/sway
  ];

  home = {
    username = "lazyload";
    homeDirectory =
      if pkgs.stdenv.isDarwin then "/Users/lazyload" else "/home/lazyload";
    stateVersion = "23.11";

    packages = with pkgs;
      [
        tailscale
      ] ++ optionals specialArgs.withGUI [
        pavucontrol
        signal-desktop
        xfce.thunar
        thunderbird
      ] ++ optionals stdenv.isLinux [
        powertop
      ];
  };

  programs = {
    neovim.enable = true;
    fish.enable = true;
    git.enable = true;
    wezterm-config.enable = true;
  };
}
