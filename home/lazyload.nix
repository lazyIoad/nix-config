{ pkgs, specialArgs, ... }: {
  imports = [
    ./common.nix
    ./modules/wezterm
    ./modules/git
    ./modules/fish
  ];

  home = {
    username = "lazyload";
    homeDirectory = if pkgs.stdenv.isDarwin then "/Users/lazyload" else "/home/lazyload";
    stateVersion = "23.11";

    packages = with pkgs; [
      flyctl
    ] ++ pkgs.lib.optionals specialArgs.withGUI [
      vscodium
    ];
  };
}
