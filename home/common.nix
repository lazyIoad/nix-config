{ pkgs, vars, ... }: {
  home = {
    packages = with pkgs; [
      cachix
      fd
      lazygit
      neofetch
      ripgrep
      tree
      tree-sitter
      wget
    ];
  };

  programs = {
    home-manager.enable = true;

    direnv = {
      enable = true;
      nix-direnv.enable = true;
    };

    fzf = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };

    zoxide = {
      enable = true;
      enableFishIntegration = true;
      enableZshIntegration = true;
    };
  };
}
