-- [nfnl] Compiled from fnl/plugins/which-key.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  vim.o.timeout = true
  vim.o.timeoutlen = 500
  return nil
end
local function _2_()
  local wk = require("which-key")
  wk.setup()
  return wk.register({f = {name = "+telescope"}, l = {name = "+lsp"}}, {prefix = "<leader>"})
end
return {"folke/which-key.nvim", event = "VeryLazy", init = _1_, config = _2_}
