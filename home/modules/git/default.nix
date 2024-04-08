{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.programs.git;
in
{
  config = mkIf cfg.enable {
    programs.git = {
      extraConfig = {
        core = { editor = "nvim"; };
        init = { defaultBranch = "master"; };
      };
      userName = "lazyload";
      userEmail = "git@lazyloading.net";
    };
  };
}
