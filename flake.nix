{
  description = "lazyload's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";      
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    import ./hosts {
      inherit nixpkgs home-manager;
    };
}

