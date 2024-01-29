(macro keybind [mode lhs rhs desc]
  `(vim.keymap.set ,mode ,lhs ,rhs {:desc ,desc :silent true}))

(keybind :n :<A-l> ":bnext<CR>" "Next buffer")
(keybind :n :<A-h> ":bprevious<CR>" "Previous buffer")
(keybind :n :<leader>h ":nohl<CR>" "Clear highlights")
(keybind :n :<A-k> ":m .-2<CR>==" "Move line up")
(keybind :n :<A-j> ":m .+1<CR>==" "Move line down")
