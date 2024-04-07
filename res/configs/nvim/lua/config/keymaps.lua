-- vim.keymap.set("n", "<A-l>", ":bnext<CR>", {desc = "Next buffer", silent = true})
-- vim.keymap.set("n", "<A-h>", ":bprevious<CR>", {desc = "Previous buffer", silent = true})
-- vim.keymap.set("n", "<leader>h", ":nohl<CR>", {desc = "Clear highlights", silent = true})
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
