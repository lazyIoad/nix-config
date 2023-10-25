{1 :nvim-treesitter/nvim-treesitter
 :event [:BufReadPost :BufNewFile]
 :main :nvim-treesitter.configs
 :opts {:ensure_installed :all
        :auto_install true
        :highlight {:enable true}
        :indent {:enable true}}}
