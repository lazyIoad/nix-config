-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
vim.loader.enable()
require("config.options")
require("config.core")
require("plugins.which-key")
require("plugins.gitsigns")
return require("plugins.telescope")
