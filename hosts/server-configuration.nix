{ pkgs, lib, inputs, ... }: {
  nix = {
    settings = {
      auto-optimise-store = true;
      allowed-users = [ "root" ];
    };
    gc = {
      automatic = true;
      options = "--delete-older-than 30d";
      dates = "weekly";
    };
    package = pkgs.nixFlakes;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  environment = {
    defaultPackages = lib.mkForce [ ];
    systemPackages = with pkgs; [ vim bash ];
  };

  users.users.serveruser = {
    description = "serveruser";
    shell = pkgs.bash;
    isNormalUser = true;
    packages = with pkgs; [ git ];
    extraGroups = [ "wheel" ];
  };

  time.timeZone = "America/New_York";

  nixpkgs.config.allowUnfree = true;
}
