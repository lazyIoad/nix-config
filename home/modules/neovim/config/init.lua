-- [nfnl] Compiled from init.fnl by https://github.com/Olical/nfnl, do not edit.
vim.loader.enable()
require("config.options")
require("config.core")
do
  local module_1_auto = require("which-key")
  module_1_auto.setup()
end
require("plugins.nvim-treesitter")
require("plugins.indent-blankline")
require("plugins.gitsigns")
return require("plugins.telescope")
