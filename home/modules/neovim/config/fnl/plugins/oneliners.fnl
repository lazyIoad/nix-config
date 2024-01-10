[{1 :nvim-tree/nvim-web-devicons :lazy true}
 {1 :nvim-lua/plenary.nvim :lazy true}
 {1 :RRethy/vim-illuminate :event :VeryLazy}
 {1 :akinsho/bufferline.nvim :config true}
 {1 :folke/zen-mode.nvim
  :cmd :ZenMode
  :opts {:window {:backdrop 1} :plugins {:options {:laststatus 3}}}}
 {1 :folke/trouble.nvim
  :event :VeryLazy
  :keys [{1 :<leader>t
          2 (fn []
              ((. (require :trouble) :toggle) :document_diagnostics))
          :desc "Open diagnostics"}]}
 {1 :kylechui/nvim-surround :config true :version "*" :event :VeryLazy}]
