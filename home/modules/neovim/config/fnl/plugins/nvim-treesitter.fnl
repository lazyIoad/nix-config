{1 :nvim-treesitter/nvim-treesitter
 :event [ :BufReadPost :BufNewFile ]
 :main :nvim-treesitter.configs
 :opts {:ensure_installed []
        :auto_install false
        :highlight {:enable true}
        :indent {:enable true}}}
