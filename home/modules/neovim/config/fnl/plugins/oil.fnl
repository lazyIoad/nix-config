{1 :stevearc/oil.nvim
 :opts { :view_options { :show_hidden true }}
 :event :VeryLazy
 :keys [{1 :<leader>o
         2 (fn []
             ((. (require :oil) :open_float)))
         :desc "Open file explorer"}]}
