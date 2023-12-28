{ pkgs, ... }: {
  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    initExtraFirst = ''
      autoload -U up-line-or-beginning-search
      autoload -U down-line-or-beginning-search
      zle -N up-line-or-beginning-search
      zle -N down-line-or-beginning-search
      bindkey "^[[A" up-line-or-beginning-search
      bindkey "^[[B" down-line-or-beginning-search

      export WORDCHARS='*?[]~!#$%^(){}<>'
    '';
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
}

