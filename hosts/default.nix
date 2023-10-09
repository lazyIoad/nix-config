{ inputs, nixpkgs, home-manager, self, ... }:

let
  mkArgs = { host, user }: {
    specialArgs = {
      inherit inputs;
      vars = {
        inherit user host;
      };
    };
  };

  mkNixosSystem = { host, user, system, withGUI }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      inherit (mkArgs { inherit host user; }) specialArgs;

      modules = [
        ./${host}
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = import ../home/${user}.nix;
          home-manager.extraSpecialArgs = {
            inherit withGUI self;
          };
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
      withGUI = true;
    };
  };
}
