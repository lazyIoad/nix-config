{1 :folke/which-key.nvim
 :event :VeryLazy
 :init (fn [] (set vim.o.timeout true) (set vim.o.timeoutlen 500))
 :config (fn []
           (local wk (require :which-key))
           (wk.setup)
           (wk.register {:f {:name :+telescope} :l {:name :+lsp}}
                        {:prefix :<leader>}))}
