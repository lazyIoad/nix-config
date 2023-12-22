-- [nfnl] Compiled from fnl/config/keymaps.fnl by https://github.com/Olical/nfnl, do not edit.
vim.keymap.set("n", "<A-l>", ":bnext<CR>", {desc = "Next buffer", silent = true})
return vim.keymap.set("n", "<A-h>", ":bprevious<CR>", {desc = "Previous buffer", silent = true})
