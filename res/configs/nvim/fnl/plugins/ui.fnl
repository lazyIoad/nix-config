(macro keybind [lhs func opts desc]
  `{1 ,lhs
    2 (fn []
        ((. (require :telescope.builtin) ,func) opts))
    :desc ,desc})

[{1 :folke/which-key.nvim
  :event :VeryLazy
  :init (fn [] (set vim.o.timeout true) (set vim.o.timeoutlen 500))
  :config (fn []
            (local wk (require :which-key))
            (wk.setup)
            (wk.register {:f {:name :+telescope} :l {:name :+lsp}}
                         {:prefix :<leader>}))}
 {1 :lewis6991/gitsigns.nvim :event :VeryLazy :config true}
 {1 :nvim-telescope/telescope.nvim
  :dependencies [{1 :nvim-telescope/telescope-fzf-native.nvim :build :make}]
  :event :VeryLazy
  :config (fn []
            (let [telescope (require :telescope)]
              ((. telescope :setup))
              ((. telescope :load_extension) :fzf)))
  :keys [(keybind :<leader>ff :find_files {} "Find file")
         (keybind :<leader>fg :live_grep {} "Search in files")
         (keybind :<leader>fb :buffers {:sort_mru true sort_lastused true}
                  "Find buffer")]}
 {1 :akinsho/bufferline.nvim
  :config (fn []
            (let [bufferline (require :bufferline)]
              (bufferline.setup {:options {:buffer_close_icon :x
                                           :style_preset bufferline.style_preset.minimal}})))}
 {1 :folke/trouble.nvim
  :event :VeryLazy
  :keys [{1 :<leader>t
          2 (fn []
              ((. (require :trouble) :toggle) :document_diagnostics))
          :desc "Open diagnostics"}]}
 {1 :folke/zen-mode.nvim
  :cmd :ZenMode
  :opts {:window {:backdrop 1} :plugins {:options {:laststatus 3}}}}]
