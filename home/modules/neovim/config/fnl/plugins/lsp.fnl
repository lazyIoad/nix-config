(local lsp-zero (require :lsp-zero))

lsp-zero.on_attach (lambda [_ bufnr]
  (lsp-zero.default_keymaps {:buffer bufnr}))

(local lsp-servers ["gopls" "rust_analyzer"])

;; Since some of my LSPs are only available in the dev shell, filter
;; for those that are in PATH and set those up.
(local available-servers
  (icollect [_ s (ipairs lsp-servers)]
    (if (= (vim.fn.executable s) 1) s)))

(lsp-zero.setup_servers available-servers)
