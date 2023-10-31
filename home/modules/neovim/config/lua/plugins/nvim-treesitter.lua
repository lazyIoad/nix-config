-- [nfnl] Compiled from fnl/plugins/nvim-treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  return {pre_hook = (require("ts_context_commentstring.integrations.comment_nvim")).create_pre_hook()}
end
return {{"nvim-treesitter/nvim-treesitter", event = {"BufReadPost", "BufNewFile"}, main = "nvim-treesitter.configs", dependencies = {{"JoosepAlviste/nvim-ts-context-commentstring", main = "ts_context_commentstring", config = true}}, opts = {ensure_installed = "all", auto_install = true, highlight = {enable = true}, indent = {enable = true}, context_commentstring = {enable = true, enable_autocmd = false}}}, {"numToStr/Comment.nvim", event = {"BufReadPost", "BufNewFile"}, main = "Comment", opts = _1_}}
