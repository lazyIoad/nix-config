(vim.loader.enable)
(require :config.options)
(require :config.core)

;; Plugins

;; Call setup on plugins that don't need any options
(import-macros {: setup} :macros)
(setup :which-key)
(setup :nvim-web-devicons)

;; Pull in other plugins
(require :plugins.nvim-treesitter)
(require :plugins.indent-blankline)
(require :plugins.gitsigns)
(require :plugins.telescope)
(require :plugins.lsp)
