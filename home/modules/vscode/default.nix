{ pkgs, ... }: {
  programs.vscode = {
    enable = true;
    # package = pkgs.vscodium;
    extensions = with pkgs.vscode-extensions; [
      mkhl.direnv
      vscodevim.vim
      rust-lang.rust-analyzer
      vadimcn.vscode-lldb
    ];
  };
}
