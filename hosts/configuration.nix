{ pkgs, vars, inputs, ... }:
let
  inherit (pkgs) stdenv;
  inherit (pkgs) mkIf;
in {
  nix = {
    settings.auto-optimise-store = true;
    gc = {
      automatic = true;
      dates = mkIf stdenv.isLinux "weekly";
      interval.Day = mkIf stdenv.isDarwin 7;
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

  users.users.${vars.user} = {
    description = "${vars.user}";
    shell = pkgs.fish;
  } ++ mkIf stdenv.isLinux {
    isNormalUser = true;
    extraGroups = [ "networkmanager" "wheel" "video" ];
  };

  programs.fish.enable = true;

  time.timeZone = "America/New_York";

  nixpkgs.config.allowUnfree = true;
}
