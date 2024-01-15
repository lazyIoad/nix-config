{
  programs = {
    git = {
      enable = true;
      extraConfig = {
        core = { editor = "hx"; };
        init = { defaultBranch = "master"; };
      };
      ignores = [ ".DS_Store" ".direnv" ];
      userName = "lazyload";
      userEmail = "git@lazyloading.net";
    };
  };
}
