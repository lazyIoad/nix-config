(local lsp-servers {:gopls :gopls})

;; Since some of my LSPs are only available in the dev shell, filter
;; for those that are in PATH and set those up.
(local available-servers
       (icollect [exec lsp (pairs lsp-servers)]
         (if (= (vim.fn.executable exec) 1) lsp)))

(macro keybind [mode lhs func desc]
  `(vim.keymap.set ,mode ,lhs (fn [] (,func)) {:desc ,desc :buffer bufnr}))

[{1 :VonHeikemen/lsp-zero.nvim
  :branch :v3.x
  :lazy true
  :config false
  :init (fn [] (set vim.g.lsp_zero_extend_cmp 0)
          (set vim.g.lsp_zero_extend_lspconfig 0))}
 {1 :hrsh7th/nvim-cmp
  :event :InsertEnter
  :dependencies [{1 :L3MON4D3/LuaSnip :build "make install_jsregexp"}]
  :config (fn []
            (local lsp-zero (require :lsp-zero))
            (lsp-zero.extend_cmp)
            (local cmp (require :cmp))
            (cmp.setup {:completion {:autocomplete false}}))}
 {1 :neovim/nvim-lspconfig
  :cmd :LspInfo
  :event [:BufReadPre :BufNewFile]
  :dependencies [:hrsh7th/cmp-nvim-lsp]
  :config (fn []
            (local lsp-zero (require :lsp-zero))
            (lsp-zero.extend_lspconfig)
            (lsp-zero.on_attach (fn [_ bufnr]
                                  (keybind :n :K vim.lsp.buf.hover
                                           "Display symbol hover information")
                                  (keybind :n :gd vim.lsp.buf.definition
                                           "Jump to symbol definition")
                                  (keybind :n :gD vim.lsp.buf.declaration
                                           "Jump to symbol declaration")
                                  (keybind :n :gi vim.lsp.buf.implementation
                                           "List symbol implementations")
                                  (keybind :n :go vim.lsp.buf.type_definition
                                           "Jump to symbol type definition")
                                  (keybind :n :gr vim.lsp.buf.references
                                           "List symbol references")
                                  (keybind :i :<C-s> vim.lsp.buf.signature_help
                                           "Display symbol signature info")
                                  (keybind :n :<leader>lrn vim.lsp.buf.rename
                                           "Rename symbol")
                                  (keybind :n :<leader>lf
                                           (fn []
                                             (vim.lsp.buf.format {:async true}))
                                           "Format buffer")
                                  (keybind :x :<leader>lf
                                           (fn []
                                             (vim.lsp.buf.format {:async true}))
                                           "Format selection")
                                  (keybind :n :<leader>lc vim.lsp.buf.format
                                           "Display code actions")
                                  (keybind :x :<leader>lc
                                           (if vim.lsp.buf.range_code_action
                                               vim.lsp.buf.range_code_action
                                               vim.lsp.buf.code_action)
                                           "Display code actions")
                                  (keybind :n :<leader>ld
                                           vim.diagnostic.open_float
                                           "Display diagnostics")
                                  (keybind :n "[d" vim.diagnostic.goto_prev
                                           "Previous diagnostic")
                                  (keybind :n "]d" vim.diagnostic.goto_next
                                           "Next diagnostic")))
            (lsp-zero.setup_servers available-servers))}]
