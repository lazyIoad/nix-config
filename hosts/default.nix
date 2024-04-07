{ inputs }:
let
  lazyload = import ../home/lazyload.nix;
  lib = import ../lib (inputs);
in
{
  nixos = {
    gaius = lib.mkNixosSystem {
      hostname = "gaius";
      hostModule = ./gaius;
      homeManagerUser = lazyload;
    };
  };

  darwin = {
    phaedra = lib.mkDarwinSystem {
      hostname = "phaedra";
      hostModule = ./phaedra;
      homeManagerUser = lazyload;
    };
  };
}
