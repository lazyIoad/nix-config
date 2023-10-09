{ pkgs, vars, ... }: {
  home = {
    packages = with pkgs; [
      cachix
      fd
      helix
      lazygit
      luajit
      neofetch
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
        theme = "gruvbox-dark";
      };
    };

    btop = {
      enable = true;
      settings = {
        color_theme = "gruvbox_dark";
        proc_gradient = false;
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
