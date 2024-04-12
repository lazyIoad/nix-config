{
  description = "lazyload's nix configurations";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

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

  outputs = inputs@{ nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };

          devShells = pkgs.mkShell {
            buildInputs = with pkgs; [
              nixpkgs-fmt
              nodePackages.prettier
            ];
          };

          formatter = pkgs.nixpkgs-fmt;
        in
        {
          inherit formatter;
          devShells.default = devShells;
        }) // (
      let
        lib = import ./lib (inputs);
        hostConfigs = import ./hosts { inherit inputs; };
      in
      {
        inherit lib;
        nixosConfigurations = hostConfigs.nixos;
        darwinConfigurations = hostConfigs.darwin;
      }
    );
}
