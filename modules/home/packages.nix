{ pkgs, vars, ... }: {
  home-manager.users.${vars.user} = {
    home.packages = with pkgs; [
      cachix
      fd
      flyctl
      helix
      lazygit
      luajit
      ripgrep
      tree-sitter
      wget
    ];
  };
}
