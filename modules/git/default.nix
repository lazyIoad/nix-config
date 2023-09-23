{
  programs = {
    git = {
      enable = true;
      extraConfig = {
        core = {
          editor = "hx";
        };
        init = {
          defaultBranch = "master";
        };
      };
      ignores = [
        ".DS_Store"
      ];
      userName = "lazyload";
      userEmail = "git@lazyloading.net";
    };
  };
}
