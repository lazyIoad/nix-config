{ pkgs, lib, vars, inputs, ... }: {
  nix.gc.dates = "weekly";

  users.users.${vars.user} = {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };
}
