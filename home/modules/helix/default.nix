{ pkgs, specialArgs, ... }: {
  home.packages = with pkgs; [
    helix
  ];

  xdg.configFile."helix" = {
    source = ./config;
  };
}
