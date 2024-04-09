{ inputs, pkgs, system, ... }: {
  imports = [
    ./modules/wezterm
    ./modules/git
    ./modules/fish
    ./modules/neovim
  ];

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
