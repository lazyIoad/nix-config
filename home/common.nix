{ inputs, pkgs, vars, system, ... }: {
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
    ] ++ [
      inputs.agenix.packages.${system}.default
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
    };

    zoxide = {
      enable = true;
    };
  };
}
