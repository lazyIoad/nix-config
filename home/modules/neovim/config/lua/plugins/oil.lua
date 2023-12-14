-- [nfnl] Compiled from fnl/plugins/oil.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return (require("oil")).open_float()
end
return {"stevearc/oil.nvim", opts = {view_options = {show_hidden = true}}, event = "VeryLazy", keys = {{"<leader>o", _1_, desc = "Open file explorer"}}}
