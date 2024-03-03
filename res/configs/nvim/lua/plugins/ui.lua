
local function _3_()
  local telescope = require("telescope")
  telescope.setup()
  return telescope.load_extension("fzf")
end
local function _4_()
  return (require("telescope.builtin")).find_files(opts)
end
local function _5_()
  return (require("telescope.builtin")).live_grep(opts)
end
local function _6_()
  return (require("telescope.builtin")).buffers(opts)
end
local function _7_()
  local bufferline = require("bufferline")
  return bufferline.setup({options = {buffer_close_icon = "x", style_preset = bufferline.style_preset.minimal}})
end
local function _8_()
  return (require("trouble")).toggle("document_diagnostics")
end
return {{"nvim-telescope/telescope.nvim", dependencies = {{"nvim-telescope/telescope-fzf-native.nvim", build = "make"}}, event = "VeryLazy", config = _3_, keys = {{"<leader>ff", _4_, desc = "Find file"}, {"<leader>fg", _5_, desc = "Search in files"}, {"<leader>fb", _6_, desc = "Find buffer"}}}, {"folke/trouble.nvim", event = "VeryLazy", keys = {{"<leader>t", _8_, desc = "Open diagnostics"}}}}
