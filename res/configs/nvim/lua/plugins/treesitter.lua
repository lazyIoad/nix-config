-- [nfnl] Compiled from fnl/plugins/treesitter.fnl by https://github.com/Olical/nfnl, do not edit.
WANTED_LANGUAGES = {"bash", "c", "cmake", "cpp", "css", "diff", "dockerfile", "eex", "elixir", "fennel", "fish", "gitignore", "go", "gomod", "gosum", "gowork", "graphql", "groovy", "hcl", "html", "ini", "java", "javascript", "jsdoc", "json", "jsonc", "lua", "luadoc", "make", "markdown", "markdown_inline", "ninja", "nix", "norg", "pem", "python", "regex", "ruby", "rust", "scss", "starlark", "svelte", "terraform", "tsx", "typescript", "vim", "vimdoc", "vue", "xml", "yaml", "zig"}
local function _1_()
  local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
  vim.keymap.set({"n", "x", "o"}, ";", ts_repeat_move.repeat_last_move_next)
  return vim.keymap.set({"n", "x", "o"}, ",", ts_repeat_move.repeat_last_move_previous)
end
local function _2_()
  return {pre_hook = (require("ts_context_commentstring.integrations.comment_nvim")).create_pre_hook()}
end
return {{"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", event = {"BufReadPost", "BufNewFile"}, main = "nvim-treesitter.configs", opts = {ensure_installed = WANTED_LANGUAGES, auto_install = true, highlight = {enable = true}, indent = {enable = true}, incremental_selection = {enable = true, keymaps = {init_selection = "<CR>", scope_incremental = "<CR>", node_incremental = "<TAB>", node_decremental = "<S-TAB>"}}, textobjects = {select = {enable = true, lookahead = true, keymaps = {ia = {query = "@parameter.inner", desc = "Select inner part of a parameter"}, aa = {query = "@parameter.outer", desc = "Select outer part of a parameter"}}}, move = {enable = true, set_jumps = true, goto_next_start = {["]f"] = {query = "@function.outer", desc = "Next function start"}, ["]a"] = {query = "@parameter.inner", desc = "Next parameter start"}}, goto_previous_start = {["[f"] = {query = "@function.outer", desc = "Previous function start"}, ["[a"] = {query = "@parameter.inner", desc = "Previous parameter start"}}}, swap = {enable = true, swap_next = {["<leader>sa"] = {query = "@parameter.inner", desc = "Swap with next parameter"}}, swap_previous = {["<leader>sA"] = {query = "@parameter.inner", desc = "Swap with previous parameter"}}}}}, dependencies = {{"nvim-treesitter/nvim-treesitter-textobjects", init = _1_}}, version = false}, {"numToStr/Comment.nvim", event = {"BufReadPost", "BufNewFile"}, main = "Comment", opts = _2_, dependencies = {{"JoosepAlviste/nvim-ts-context-commentstring", main = "ts_context_commentstring", config = true}}}}