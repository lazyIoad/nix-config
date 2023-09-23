{ pkgs, vars, ... }: {
  imports = [
    ./packages.nix
  ];

  home-manager.users.${vars.user} = {
    imports = [
      ../../modules/git
      ../../modules/fish
    ];

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
