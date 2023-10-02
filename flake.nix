{
  description = "lazyload's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    flake-utils.url = "github:numtide/flake-utils";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";      
    };
  };

  outputs = inputs @ { self, nixpkgs, flake-utils, home-manager, ... }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let
          pkgs = import nixpkgs {
            inherit system;
          };
        in
        with pkgs; {
          devShells.default = mkShell {
            buildInputs = [
              nixfmt
            ];
          };
        }
    ) //
    import ./hosts {
      inherit inputs nixpkgs home-manager;
    };
}
