{1 :stevearc/oil.nvim
 :config true
 :event :VeryLazy
 :keys [{1 :<leader>o
         2 (fn []
             ((. (require :oil) :open_float)))
         :desc "Open file explorer"}]}
