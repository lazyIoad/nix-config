(macro keybind [lhs func desc]
  `{1 ,lhs 2 (fn [] ((. (require :telescope.builtin) ,func))) :desc ,desc})

{1 :nvim-telescope/telescope.nvim
 :dependencies [{1 :nvim-telescope/telescope-fzf-native.nvim :build :make}]
 :config (fn [] (let [telescope (require :telescope)]
                  ((. telescope :setup))
                  ((. telescope :load_extension) :fzf)))
 ;:keys [{1 :<leader>ff 2 (fn [] ((. (require :telescope.builtin) :find_files))) :desc "Find file"}]}
 :keys [(keybind :<leader>ff :find_files "Find file")
        (keybind :<leader>fg :live_grep "Search in files")
        (keybind :<leader>fb :buffers "Find buffer")]}


;;(register-key-group :n :f {
;;  :name "+telescope"
 ;; :f [builtin.find_files "Find file"]
  ;;:g [builtin.live_grep "Find in files"]
  ;;:b [builtin.buffers "Buffers"]})
