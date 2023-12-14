-- [nfnl] Compiled from fnl/plugins/oneliners.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return (require("trouble")).toggle("document_diagnostics")
end
return {{"nvim-tree/nvim-web-devicons", lazy = true}, {"nvim-lua/plenary.nvim", lazy = true}, {"RRethy/vim-illuminate", event = "VeryLazy"}, {"akinsho/bufferline.nvim", config = true}, {"folke/zen-mode.nvim", cmd = "ZenMode"}, {"folke/trouble.nvim", event = "VeryLazy", keys = {{"<leader>t", _1_, desc = "Open diagnostics"}}}, {"kylechui/nvim-surround", config = true, version = "*", event = "VeryLazy"}}
