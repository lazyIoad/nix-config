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
   #   nvim-treesitter.withAllGrammars
  #     nvim-treesitter-textobjects
  #     plenary-nvim
  #     which-key-nvim
  #     telescope-nvim
  #     telescope-fzf-native-nvim

  #     # UI
  #     gitsigns-nvim
  #     gruvbox-material
  #     indent-blankline-nvim
  #     nvim-web-devicons

  #     # TODO
  #     # oil-nvim
#    ];
  };

  xdg.configFile = {
    "nvim".source = config.lib.file.mkOutOfStoreSymlink
      "${config.home.homeDirectory}/workspace/dots/home/modules/neovim/config";
  };
}
