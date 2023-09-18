{
  description = "lazyload's dotfiles";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";      
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
      lazyload = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.lazyload = import ./home.nix;
          }
        ];
      };
    };
  };
}
