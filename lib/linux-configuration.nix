{ ... }: {
  nix.gc.dates = "weekly";

  zramSwap.enable = true;
}
