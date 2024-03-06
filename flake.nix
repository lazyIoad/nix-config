{
  description = "lazyload's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    agenix = {
      url = "github:ryantm/agenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, agenix, darwin, flake-utils, home-manager }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          formatter = pkgs.nixpkgs-fmt;
          devShells.default =
            pkgs.mkShell { buildInputs = with pkgs; [ nixpkgs-fmt stylua ]; };
        }) // import ./hosts { inherit inputs nixpkgs agenix darwin home-manager self; };
}
