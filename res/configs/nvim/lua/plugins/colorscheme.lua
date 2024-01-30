-- [nfnl] Compiled from fnl/plugins/colorscheme.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return vim.cmd.colorscheme("catppuccin-latte")
end
return {"catppuccin/nvim", name = "catppuccin", priority = 1000, config = _1_, lazy = false}
