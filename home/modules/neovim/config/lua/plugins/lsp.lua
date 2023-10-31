-- [nfnl] Compiled from fnl/plugins/lsp.fnl by https://github.com/Olical/nfnl, do not edit.
local lsp_servers = {gopls = "gopls"}
local available_servers
do
  local tbl_17_auto = {}
  local i_18_auto = #tbl_17_auto
  for exec, lsp in pairs(lsp_servers) do
    local val_19_auto
    if (vim.fn.executable(exec) == 1) then
      val_19_auto = lsp
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
    local function _7_()
      return vim.lsp.buf.hover()
    end
    vim.keymap.set("n", "K", _7_, {buffer = bufnr, desc = "Display symbol hover information"})
    local function _8_()
      return vim.lsp.buf.definition()
    end
    vim.keymap.set("n", "gd", _8_, {buffer = bufnr, desc = "Jump to symbol definition"})
    local function _9_()
      return vim.lsp.buf.declaration()
    end
    vim.keymap.set("n", "gD", _9_, {buffer = bufnr, desc = "Jump to symbol declaration"})
    local function _10_()
      return vim.lsp.buf.implementation()
    end
    vim.keymap.set("n", "gi", _10_, {buffer = bufnr, desc = "List symbol implementations"})
    local function _11_()
      return vim.lsp.buf.type_definition()
    end
    vim.keymap.set("n", "go", _11_, {buffer = bufnr, desc = "Jump to symbol type definition"})
    local function _12_()
      return vim.lsp.buf.references()
    end
    vim.keymap.set("n", "gr", _12_, {buffer = bufnr, desc = "List symbol references"})
    local function _13_()
      return vim.lsp.buf.signature_help()
    end
    vim.keymap.set("i", "<C-s>", _13_, {buffer = bufnr, desc = "Display symbol signature info"})
    local function _14_()
      return vim.lsp.buf.rename()
    end
    vim.keymap.set("n", "<leader>lrn", _14_, {buffer = bufnr, desc = "Rename symbol"})
    local function _15_()
      local function _16_()
        return vim.lsp.buf.format({async = true})
      end
      return _16_()
    end
    vim.keymap.set("n", "<leader>lf", _15_, {buffer = bufnr, desc = "Format buffer"})
    local function _17_()
      local function _18_()
        return vim.lsp.buf.format({async = true})
      end
      return _18_()
    end
    vim.keymap.set("x", "<leader>lf", _17_, {buffer = bufnr, desc = "Format selection"})
    local function _19_()
      return vim.lsp.buf.format()
    end
    vim.keymap.set("n", "<leader>lc", _19_, {buffer = bufnr, desc = "Display code actions"})
    local function _20_()
      local _21_
      if vim.lsp.buf.range_code_action then
        _21_ = vim.lsp.buf.range_code_action
      else
        _21_ = vim.lsp.buf.code_action
      end
      return _21_()
    end
    vim.keymap.set("x", "<leader>lc", _20_, {buffer = bufnr, desc = "Display code actions"})
    local function _23_()
      return vim.diagnostic.open_float()
    end
    vim.keymap.set("n", "<leader>ld", _23_, {buffer = bufnr, desc = "Display diagnostics"})
    local function _24_()
      return vim.diagnostic.goto_prev()
    end
    vim.keymap.set("n", "[d", _24_, {buffer = bufnr, desc = "Previous diagnostic"})
    local function _25_()
      return vim.diagnostic.goto_next()
    end
    return vim.keymap.set("n", "]d", _25_, {buffer = bufnr, desc = "Next diagnostic"})
  end
  lsp_zero.on_attach(_6_)
  return lsp_zero.setup_servers(available_servers)
end
return {{"VonHeikemen/lsp-zero.nvim", branch = "v3.x", lazy = true, init = _3_, config = false}, {"hrsh7th/nvim-cmp", event = "InsertEnter", dependencies = {{"L3MON4D3/LuaSnip", build = "make install_jsregexp"}}, config = _4_}, {"neovim/nvim-lspconfig", cmd = "LspInfo", event = {"BufReadPre", "BufNewFile"}, dependencies = {"hrsh7th/cmp-nvim-lsp"}, config = _5_}}
