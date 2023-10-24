(local lazypath (.. (vim.fn.stdpath :data) :/lazy/lazy.nvim))

(when (not (vim.loop.fs_stat lazypath))
  (vim.fn.system [:git
                  :clone
                  "--filter=blob:none"
                  "https://github.com/folke/lazy.nvim.git"
                  :--branch=stable
                  lazypath]))

(vim.opt.rtp:prepend lazypath)

(local lazy (require :lazy))
(local disabled_plugins [:gzip :netrwPlugin :tarPlugin :tohtml :tutor :zipPlugin])

(lazy.setup
  {:performance
    {:rtp {:disabled_plugins disabled_plugins}}
     :spec [{:import :plugins}]})
