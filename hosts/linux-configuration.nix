{ vars, ... }: {
  nix.gc.dates = "weekly";

  users.users.${vars.user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" ];
    home = "/home/${vars.user}";
  };
}
