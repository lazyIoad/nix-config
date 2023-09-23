{ pkgs, vars, ... }: {
  home-manager.users.${vars.user} = {
     imports = [
      ../git
      ../fish
    ];

    programs = {
      bat = {
        enable = true;
        config = {
          theme = "base16";
        };
      };

      direnv = {
        enable = true;
        nix-direnv.enable = true;
      };

      fzf = {
        enable = true;
        enableFishIntegration = true;
      };

      zoxide = {
        enable = true;
        enableFishIntegration = true;
      };
    };
  };
}
