{ pkgs, ... }: {
  programs = {
    zsh = {
      enable = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
      zsh-abbr = {
        enable = true;
        abbreviations = {
          e = "$EDITOR";
          ga = "git add";
          gb = "git branch";
          gc = "git checkout";
          gc- = "git switch -";
          gcb = "git switch -c";
          gcd = "git switch $GIT_DEFAULT_BRANCH";
          gcm = "git switch master";
          gcom = "git commit -m ";
          gp = "git pull --rebase";
          gps = "git push";
          gr = "cd $(git root)";
          grem = "git rebase master";
          gs = "git status";
          ws = "cd $WORKSPACE";
        };
      };
    };
  };
}

