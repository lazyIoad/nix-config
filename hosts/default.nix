{ inputs, nixpkgs, home-manager, ... }:

let
  mkArgs = { host, user }: {
    specialArgs = {
      inherit inputs;
      vars = {
        inherit user host;
      };
    };
  };

  mkNixosSystem = { host, user, system }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      inherit (mkArgs { inherit host user; }) specialArgs;

      modules = [
        ./${host}
        ./configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
        }
      ];
    };
in {
  nixosConfigurations = {
    gaius = mkNixosSystem {
      host = "gaius";
      user = "lazyload";
      system = "x86_64-linux";
    };
  };
}
