{ vars, ... }: {
  nix.gc.dates = "weekly";

  zramSwap.enable = true;

  users.users.${vars.user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" ];
    home = "/home/${vars.user}";
  };
}
