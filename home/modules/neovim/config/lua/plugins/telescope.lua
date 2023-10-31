-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local function _1_()
  local telescope = require("telescope")
  telescope.setup()
  return telescope.load_extension("fzf")
end
local function _2_()
  return (require("telescope.builtin")).find_files()
end
local function _3_()
  return (require("telescope.builtin")).live_grep()
end
local function _4_()
  return (require("telescope.builtin")).buffers()
end
return {"nvim-telescope/telescope.nvim", dependencies = {{"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}, event = "VeryLazy", config = _1_, keys = {{"<leader>ff", _2_, desc = "Find file"}, {"<leader>fg", _3_, desc = "Search in files"}, {"<leader>fb", _4_, desc = "Find buffer"}}}
