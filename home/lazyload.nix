{ pkgs, lib, specialArgs, ... }:
let
  inherit (pkgs) stdenv;
  inherit (lib) optionals;
in
{
  imports = [
    ./common.nix
    ./modules/wezterm
    ./modules/git
    ./modules/fish
    ./modules/helix
    ./modules/neovim
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
        flyctl
      ] ++ optionals specialArgs.withGUI [
        pavucontrol
        signal-desktop
        xfce.thunar
        thunderbird
      ] ++ optionals stdenv.isLinux [
        powertop
      ];
  };
}
