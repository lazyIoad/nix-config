{ specialArgs, ... }: {
  xdg.configFile."helix" = {
    source = ./config;
  };
}
