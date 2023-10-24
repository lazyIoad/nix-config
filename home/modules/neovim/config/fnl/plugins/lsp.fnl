(local lsp-servers ["gopls" "rust_analyzer"])

;; Since some of my LSPs are only available in the dev shell, filter
;; for those that are in PATH and set those up.
(local available-servers
  (icollect [_ s (ipairs lsp-servers)]
    (if (= (vim.fn.executable s) 1) s)))

[
  {1 :VonHeikemen/lsp-zero.nvim
   :branch :v3.x
   :lazy true
   :config false
   :init (fn [] (set vim.g.lsp_zero_extend_cmp 0) (set vim.g.lsp_zero_extend_lspconfig 0))}
  {1 :hrsh7th/nvim-cmp
   :event :InsertEnter
   :dependencies [{1 :L3MON4D3/LuaSnip :build "make install_jsregexp"}]
   :config (fn []
             (local lsp_zero (require :lsp-zero))
             (lsp_zero.extend_cmp))}
  {1 :neovim/nvim-lspconfig
   :cmd :LspInfo
   :event [:BufReadPre :BufNewFile]
   :dependencies [:hrsh7th/cmp-nvim-lsp]
   :config (fn []
             (local lsp_zero (require :lsp-zero))
             (lsp_zero.extend_lspconfig)
             (lsp_zero.on_attach (fn [_ bufnr]
                                   (lsp_zero.default_keymaps {:buffer bufnr})))
             (lsp_zero.setup_servers available-servers))}
]
