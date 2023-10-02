{ pkgs, vars, ... }: {
  home = {
    packages = with pkgs; [
      cachix
      fd
      helix
      lazygit
      luajit
      ripgrep
      tree
      tree-sitter
      wget
    ];
  };

  programs = {
    home-manager.enable = true;

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

    eza = {
      enable = true;
      enableAliases = true;
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
}
