{ pkgs, ... }: rec {
  system.stateVersion = 4;

  users.users.lazyload = {
    description = "lazyload";
    home = "/Users/lazyload";
    shell = pkgs.fish;
  };

  programs.fish.enable = true;

  networking = {
    hostName = "phaedra";
    computerName = "phaedra";
  };

  environment = {
    variables = {
      EDITOR = "nvim";
      WORKSPACE = "{users.users.lazyload.home}/workspace";
    };
  };

  services.nix-daemon.enable = true;
}
