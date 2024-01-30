[{1 :stevearc/oil.nvim
  :opts {:view_options {:show_hidden true}}
  :event :VeryLazy
  :keys [{1 :<leader>o
          2 (fn []
              ((. (require :oil) :toggle_float)))
          :desc "Toggle file explorer"}]}
 {1 :lukas-reineke/indent-blankline.nvim
  :main :ibl
  :opts {:scope {:show_start false :show_end false}}
  :event :VeryLazy}
 {1 :kylechui/nvim-surround :config true :version "*" :event :VeryLazy}
 {1 :RRethy/vim-illuminate :event :VeryLazy}]
