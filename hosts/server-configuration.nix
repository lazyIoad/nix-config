{ pkgs, inputs, ... }: {
  nix = {
    settings.auto-optimise-store = true;
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

  users.users.serveruser = {
    description = "serveruser";
    shell = pkgs.bash;
    isNormalUser = true;
  };

  time.timeZone = "America/New_York";

  nixpkgs.config.allowUnfree = true;
}
