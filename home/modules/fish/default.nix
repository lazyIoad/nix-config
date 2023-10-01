{ pkgs, ... }: {
  programs = {
    fish = {
      enable = true;
      functions = {
        mkcd = {
          description = "Make a directory and enter it";
          body = "mkdir -p $argv[1]; and cd $argv[1]";
        };
      };
      plugins = [
        {
          name = "fzf";
          src = pkgs.fetchFromGitHub {
            owner = "PatrickF1";
            repo = "fzf.fish";
            rev = "63c8f8e65761295da51029c5b6c9e601571837a1";
            sha256 = "sha256-i9FcuQdmNlJnMWQp7myF3N0tMD/2I0CaMs/PlD8o1gw=";
          };
        }
      ];
      shellAbbrs = {
        e = "nvim";
        ga = "git add";
        gb = "git branch";
        gc = "git checkout";
        gc- = "git checkout -";
        gcb = "git checkout -b";
        gcm = "git checkout master";
        gcom = "git commit -m ";
        gp = "git pull --rebase";
        gps = "git push";
        grem = "git rebase master";
        n = "nvim";
        ws = "cd $WORKSPACE";
      };
    };
  };
}
