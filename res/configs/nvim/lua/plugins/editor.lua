-- [nfnl] Compiled from fnl/plugins/editor.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return (require("oil")).toggle_float()
end
return {{"stevearc/oil.nvim", opts = {view_options = {show_hidden = true}}, event = "VeryLazy", keys = {{"<leader>o", _1_, desc = "Toggle file explorer"}}}, {"lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {scope = {show_end = false, show_start = false}}, event = "VeryLazy"}, {"kylechui/nvim-surround", config = true, version = "*", event = "VeryLazy"}, {"RRethy/vim-illuminate", event = "VeryLazy"}}
