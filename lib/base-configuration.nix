{ pkgs, lib, inputs, ... }: {
  nix = {
    settings = {
      warn-dirty = false;
      auto-optimise-store = true;
      substituters = [
        "https://nix-community.cachix.org"
        "https://cache.nixos.org/"
      ];
    };

    gc = {
      automatic = true;
      options = "--delete-older-than 2d";
    };

    package = pkgs.nixFlakes;
    registry.nixpkgs.flake = inputs.nixpkgs;
    extraOptions = ''
      experimental-features = nix-command flakes
      keep-outputs          = true
      keep-derivations      = true
    '';
  };

  time.timeZone = "America/New_York";

  nixpkgs.config.allowUnfree = true;
}
