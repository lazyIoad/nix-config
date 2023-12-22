(macro keybind [mode lhs rhs desc]
  `(vim.keymap.set ,mode ,lhs ,rhs {:desc ,desc :silent true}))

(keybind :n :<A-l> ":bnext<CR>" "Next buffer")
(keybind :n :<A-h> ":bprevious<CR>" "Previous buffer")
