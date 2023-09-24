# Core programs managed by home-manager

{ pkgs, vars, ... }: {
  home-manager.users.${vars.user} = {
     imports = [
      ../git
      ../fish
      # ./modules/wezterm
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
