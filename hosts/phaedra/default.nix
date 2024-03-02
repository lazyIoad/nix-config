{ config, pkgs, vars, ... }: rec {
  system.stateVersion = 4;

  networking = {
    hostName = "phaedra";
    computerName = "phaedra";
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      WORKSPACE = "/Users/${vars.user}/workspace";
    };
  };

  services.nix-daemon.enable = true;
}
