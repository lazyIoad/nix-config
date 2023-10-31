[{1 :nvim-treesitter/nvim-treesitter
  :event [:BufReadPost :BufNewFile]
  :main :nvim-treesitter.configs
  :dependencies [{1 :JoosepAlviste/nvim-ts-context-commentstring
                  :main :ts_context_commentstring
                  :config true}]
  :opts {:ensure_installed :all
         :auto_install true
         :highlight {:enable true}
         :indent {:enable true}
         :context_commentstring {:enable true :enable_autocmd false}}}
 {1 :numToStr/Comment.nvim
  :event [:BufReadPost :BufNewFile]
  :main :Comment
  :opts (fn []
          {:pre_hook ((. (require :ts_context_commentstring.integrations.comment_nvim)
                         :create_pre_hook))})}]
