-- [nfnl] Compiled from fnl/plugins/telescope.fnl by https://github.com/Olical/nfnl, do not edit.
local telescope = require("telescope")
local builtin = require("telescope.builtin")
telescope.setup()
telescope.load_extension("fzf")
local wk_2_auto = require("which-key")
return wk_2_auto.register({f = {name = "+telescope", f = {builtin.find_files, "Find file"}, g = {builtin.live_grep, "Find in files"}, b = {builtin.buffers, "Buffers"}}}, {mode = "n", prefix = "<leader>"})
