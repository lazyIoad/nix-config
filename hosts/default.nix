{ self
, nixpkgs
, darwin
, home-manager
, ...
} @ inputs:

let
  mkArgs = { host, shell, user }: {
    specialArgs = {
      inherit inputs;
      vars = { inherit host shell user; };
    };
  };

  mkNixosSystem = { host, shell, user, system, withGUI }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      inherit (mkArgs { inherit host shell user; }) specialArgs;

      modules = [
        ./${host}
        ./configuration.nix
        ./linux-configuration.nix # couldn't figure out how to use mkIf :(
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.${user} = import ../home/${user}.nix;
          home-manager.extraSpecialArgs = { inherit inputs system withGUI self; };
        }
      ];
    };

  mkNixosServerSystem = { host, system }:
    nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };

      modules = [ ./${host} ./server-configuration.nix ];
    };

  mkDarwinSystem = { host, shell, user, system }:
    darwin.lib.darwinSystem {
      inherit system;
      inherit (mkArgs { inherit host shell user; }) specialArgs;

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
            inherit self inputs system;
            withGUI = false;
          };
        }
      ];
    };
in
{
  nixosConfigurations = {
    gaius = mkNixosSystem rec {
      host = "gaius";
      shell = nixpkgs.legacyPackages.${system}.fish;
      user = "lazyload";
      system = "x86_64-linux";
      withGUI = true;
    };

    valus = mkNixosServerSystem rec {
      host = "valus";
      system = "aarch64-linux";
    };
  };

  darwinConfigurations = {
    phaedra = mkDarwinSystem rec {
      host = "phaedra";
      shell = nixpkgs.legacyPackages.${system}.fish;
      user = "lazyload";
      system = "x86_64-darwin";
    };
  };
}
