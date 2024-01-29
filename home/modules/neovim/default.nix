{ config, lib, ... }:

{
  programs.neovim.enable = true;

  xdg.configFile = {
    "nvim".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/workspace/dots/res/configs/nvim";
  };
}
