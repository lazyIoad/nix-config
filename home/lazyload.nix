{ pkgs, specialArgs, ... }: {
  imports = [
    ./common.nix
    ./modules/wezterm
    ./modules/git
    ./modules/fish
    ./modules/helix
    ./modules/sway
  ];

  home = {
    username = "lazyload";
    homeDirectory = if pkgs.stdenv.isDarwin then "/Users/lazyload" else "/home/lazyload";
    stateVersion = "23.11";

    packages = with pkgs; [
      flyctl
      powertop
    ] ++ pkgs.lib.optionals specialArgs.withGUI [
      pavucontrol
      vscodium
      signal-desktop
      xfce.thunar
    ];
  };
}
