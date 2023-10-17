(import-macros {: register-key-group} :macros)

(local telescope (require :telescope))
(local builtin (require :telescope.builtin))

(telescope.setup)
(telescope.load_extension :fzf)

(register-key-group :n :f {
  :name "+telescope"
  :f [builtin.find_files "Find file"]
  :g [builtin.live_grep "Find in files"]
  :b [builtin.buffers "Buffers"]})
