{ lib, config, pkgs, ... }:
let
  cfg = config.programs.fish;
in
{
  config = lib.mkIf cfg.enable
    {
      programs.fish = {
        shellAbbrs = {
          e = "$EDITOR";
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
          gs = "git status";
          ws = "cd $WORKSPACE";
        };

        plugins =
          [{
            name = "fzf";
            src = pkgs.fetchFromGitHub {
              owner = "PatrickF1";
              repo = "fzf.fish";
              rev = "63c8f8e65761295da51029c5b6c9e601571837a1";
              sha256 = "sha256-i9FcuQdmNlJnMWQp7myF3N0tMD/2I0CaMs/PlD8o1gw=";
            };
          }] ++ pkgs.lib.optionals pkgs.stdenv.isDarwin [{
            name = "nix-env";
            src = pkgs.fetchFromGitHub {
              owner = "lilyball";
              repo = "nix-env.fish";
              rev = "7b65bd228429e852c8fdfa07601159130a818cfa";
              sha256 = "069ybzdj29s320wzdyxqjhmpm9ir5815yx6n522adav0z2nz8vs4";
            };
          }];

        functions = {
          mkcd = {
            description = "Make a directory and enter it";
            body = "mkdir -p $argv[1]; and cd $argv[1]";
          };
        };
      };

      programs = {
        fzf.enableFishIntegration = true;
        zoxide.enableFishIntegration = true;
      };
    };
}
