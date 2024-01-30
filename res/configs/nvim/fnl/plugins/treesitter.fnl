(set WANTED_LANGUAGES [:bash
                       :c
                       :cmake
                       :cpp
                       :css
                       :diff
                       :dockerfile
                       :eex
                       :elixir
                       :fennel
                       :fish
                       :gitignore
                       :go
                       :gomod
                       :gosum
                       :gowork
                       :graphql
                       :groovy
                       :hcl
                       :html
                       :ini
                       :java
                       :javascript
                       :jsdoc
                       :json
                       :jsonc
                       :lua
                       :luadoc
                       :make
                       :markdown
                       :markdown_inline
                       :ninja
                       :nix
                       :norg
                       :pem
                       :python
                       :regex
                       :ruby
                       :rust
                       :scss
                       :starlark
                       :svelte
                       :terraform
                       :tsx
                       :typescript
                       :vim
                       :vimdoc
                       :vue
                       :xml
                       :yaml
                       :zig])

[{1 :nvim-treesitter/nvim-treesitter
  :version false
  :build ":TSUpdate"
  :event [:BufReadPost :BufNewFile]
  :main :nvim-treesitter.configs
  :opts {:ensure_installed WANTED_LANGUAGES
         :auto_install true
         :highlight {:enable true}
         :indent {:enable true}
         :incremental_selection {:enable true
                                 :keymaps {:init_selection :<CR>
                                           :scope_incremental :<CR>
                                           :node_incremental :<TAB>
                                           :node_decremental :<S-TAB>}}
         :textobjects {:select {:enable true
                                :lookahead true
                                :keymaps {:ia {:query "@parameter.inner"
                                               :desc "Select inner part of a parameter"}
                                          :aa {:query "@parameter.outer"
                                               :desc "Select outer part of a parameter"}}}
                       :move {:enable true
                              :set_jumps true
                              :goto_next_start {"]f" {:query "@function.outer"
                                                      :desc "Next function start"}
                                                "]a" {:query "@parameter.inner"
                                                      :desc "Next parameter start"}}
                              :goto_previous_start {"[f" {:query "@function.outer"
                                                          :desc "Previous function start"}
                                                    "[a" {:query "@parameter.inner"
                                                          :desc "Previous parameter start"}}}
                       :swap {:enable true
                              :swap_next {:<leader>sa {:query "@parameter.inner"
                                                       :desc "Swap with next parameter"}}
                              :swap_previous {:<leader>sA {:query "@parameter.inner"
                                                           :desc "Swap with previous parameter"}}}}}
  :dependencies [{1 :nvim-treesitter/nvim-treesitter-textobjects
                  :init (fn []
                          (let [ts_repeat_move (require :nvim-treesitter.textobjects.repeatable_move)]
                            (vim.keymap.set [:n :x :o] ";"
                                            ts_repeat_move.repeat_last_move_next)
                            (vim.keymap.set [:n :x :o] ","
                                            ts_repeat_move.repeat_last_move_previous)))}]}
 {1 :numToStr/Comment.nvim
  :event [:BufReadPost :BufNewFile]
  :main :Comment
  :opts (fn []
          {:pre_hook ((. (require :ts_context_commentstring.integrations.comment_nvim)
                         :create_pre_hook))})
  :dependencies [{1 :JoosepAlviste/nvim-ts-context-commentstring
                  :main :ts_context_commentstring
                  :config true}]}]
