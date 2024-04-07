{ lib, config, pkgs, ... }:
let
  cfg = config.programs.zsh;
in
{
  config = lib.mkIf cfg.enable {
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

      history = {
        size = 1000000000;
        save = 1000000000;
      };
    };

    programs = {
      fzf.enableZshIntegration = config.programs.fzf.enable;
      zoxide.enableZshIntegration = config.programs.zoxide.enable;
      direnv.enableZshIntegration = config.programs.direnv.enable;

      starship = {
        enable = true;
        enableZshIntegration = true;
      };
    };

    xdg.configFile."starship.toml".source =
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/workspace/dotfiles/starship/config.toml";
  };
}
