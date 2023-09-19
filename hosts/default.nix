{ nixpkgs, home-manager, ... }:

let
  mkNixosSystem = { user, host }:
    nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        ./${host}/configuration.nix
        home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = import ./${host}/home.nix;
        }
      ];
    };
in
{
  nixosConfigurations = {
    gaius = mkNixosSystem {
      user = "lazyload";
      host = "gaius";
    };
  };
}

