{ inputs, nixpkgs, home-manager, ... }:

let
  mkNixosSystem = { host, user, system }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = {
        inherit inputs;
        vars = {
          inherit user host;
        };
      };
      modules = [
        ./${host}
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
      ];
    };
in
{
  nixosConfigurations = {
    gaius = mkNixosSystem {
      host = "gaius";
      user = "lazyload";
      system = "x86_64-linux";
    };
  };
}
