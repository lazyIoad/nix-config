-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
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
local function _3_()
  vim.g.lsp_zero_extend_cmp = 0
  vim.g.lsp_zero_extend_lspconfig = 0
  return nil
end
local function _4_()
  local lsp_zero = require("lsp-zero")
  lsp_zero.extend_cmp()
  local cmp = require("cmp")
  return cmp.setup({completion = {autocomplete = false}})
end
local function _5_()
  local lsp_zero = require("lsp-zero")
  lsp_zero.extend_lspconfig()
  local function _6_(_, bufnr)
    lsp_zero.extend_lspconfig()
    return lsp_zero.default_keymaps({buffer = bufnr, preserve_mappings = false})
  end
  lsp_zero.on_attach(_6_)
  return lsp_zero.setup_servers(available_servers)
end
return {{"VonHeikemen/lsp-zero.nvim", branch = "v3.x", lazy = true, init = _3_, config = false}, {"hrsh7th/nvim-cmp", event = "InsertEnter", dependencies = {{"L3MON4D3/LuaSnip", build = "make install_jsregexp"}}, config = _4_}, {"neovim/nvim-lspconfig", cmd = "LspInfo", event = {"BufReadPre", "BufNewFile"}, dependencies = {"hrsh7th/cmp-nvim-lsp"}, config = _5_}}
