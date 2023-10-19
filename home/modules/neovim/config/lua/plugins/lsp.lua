-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local lsp_zero = require("lsp-zero")
do local _ = lsp_zero.on_attach end
local function _1_(_, bufnr)
  _G.assert((nil ~= bufnr), "Missing argument bufnr on /home/lazyload/workspace/dots/home/modules/neovim/config/fnl/plugins/lsp.fnl:3")
  return lsp_zero.default_keymaps({buffer = bufnr})
end
local lsp_servers = {"gopls", "rust_analyzer"}
local available_servers
do
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for _, s in ipairs(lsp_servers) do
    local val_19_auto
    if (vim.fn.executable(s) == 1) then
      val_19_auto = s
    else
      val_19_auto = nil
    end
    if (nil ~= val_19_auto) then
      i_18_auto = (i_18_auto + 1)
      do end (tbl_17_auto)[i_18_auto] = val_19_auto
    else
    end
  end
  available_servers = tbl_17_auto
end
return lsp_zero.setup_servers(available_servers)
