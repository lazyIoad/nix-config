{ inputs, nixpkgs, darwin, home-manager, self, ... }:

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
        ./linux-configuration.nix # couldn't figure out how to use mkIf :(
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

  mkDarwinSystem = { host, user, system }:
    darwin.lib.darwinSystem {
      inherit system;
      inherit (mkArgs { inherit host user; }) specialArgs;

      modules = [
        ./${host}
        ./configuration.nix
        ./darwin-configuration.nix
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = import ../home/${user}.nix;
          home-manager.extraSpecialArgs = {
            inherit self;
            withGUI = false;
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
