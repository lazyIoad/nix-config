{ nixpkgs
, darwin
, home-manager
, ...
}@inputs:
rec {
  mkNixosSystem =
    { hostname
    , hostModule
    , homeManagerUser
    , user ? "lazyload"
    , system ? "x86_64-linux"
    , withGUI ? true
    }:
    nixpkgs.lib.nixosSystem {
      inherit system;

      specialArgs = { inherit inputs; };

      modules = [
        ./base-configuration.nix
        ./linux-configuration.nix
        hostModule
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = homeManagerUser;
          home-manager.extraSpecialArgs = { inherit inputs system withGUI; };
          home-manager.sharedModules = [ ../home/common.nix ];
        }
      ];
    };

  mkDarwinSystem =
    { hostname
    , hostModule
    , homeManagerUser
    , user ? "lazyload"
    , system ? "x86_64-darwin"
    }:
    darwin.lib.darwinSystem {
      inherit system;

      specialArgs = { inherit inputs; };

      modules = [
        ./base-configuration.nix
        ./darwin-configuration.nix
        hostModule
        home-manager.darwinModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = homeManagerUser;
          home-manager.extraSpecialArgs = {
            inherit inputs system;
            withGUI = false;
          };
          home-manager.sharedModules = [ ../home/common.nix ];
        }
      ];
    };
}
