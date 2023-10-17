;; [nfnl-macro]

(fn setup [name]
  `(let [module# (require ,name)]
    (module#.setup)))

(fn register-key-group [mode group mappings]
  `(let [wk# (require :which-key)]
     (wk#.register { ,group ,mappings } { :prefix "<leader>" :mode ,mode })))

{: setup
 : register-key-group}
