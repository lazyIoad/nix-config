[{1 :nvim-tree/nvim-web-devicons :lazy true}
 {1 :nvim-lua/plenary.nvim :lazy true}
 {1 :folke/trouble.nvim
  :event :VeryLazy
  :keys [{1 :<leader>t
          2 (fn []
              ((. (require :trouble) :toggle) :document_diagnostics))
          :desc "Open diagnostics"}]}
 {1 :kylechui/nvim-surround :config true :version "*" :event :VeryLazy}]
