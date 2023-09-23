{ pkgs, vars, ... }: {
  imports = [
    ./packages.nix
    ./programs.nix
  ];

  home-manager.users.${vars.user} = {
    home = {
      username = "${vars.user}";
      homeDirectory = "/home/${vars.user}";
      stateVersion = "23.11";
    };

    programs = {
      home-manager.enable = true;
    };
  };
}
