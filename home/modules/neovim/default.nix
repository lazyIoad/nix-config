{ config, lib, ... }:

{
  programs.neovim = {
    enable = true;
#    plugins = with pkgs.vimPlugins; [
  #     # LSP
  #     cmp-nvim-lsp
  #     lsp-zero-nvim
  #     luasnip
  #     nvim-cmp
  #     nvim-lspconfig

  #     # Util
  #     nvim-treesitter-textobjects
#    ];
  };

  xdg.configFile = {
    "nvim".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/workspace/dots/home/modules/neovim/config";
  };
}
