-- [nfnl] Compiled from fnl/plugins/nvim-treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
return {"nvim-treesitter/nvim-treesitter", event = {"BufReadPost", "BufNewFile"}, main = "nvim-treesitter.configs", opts = {ensure_installed = "all", auto_install = true, highlight = {enable = true}, indent = {enable = true}}}
