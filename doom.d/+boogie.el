;;; ~/.dotfiles/doom.d/+boogie.el -*- lexical-binding: t; -*-

(after! boogie-friends
  (setq flycheck-dafny-executable "/usr/bin/dafny")
  (set-company-backend! 'dafny-mode
    'dafny-attributes-backend boogie-friends-ordered-backends
    'company-yasnippet 'company-capf)
  (set-pretty-symbols! 'dafny-mode
    :alist (append '(("in" . ?∈) ("!in" . ?∉) ("!!" . ?‼) ("!" . ?¬)
                     ("forall" . ?∀) ("function" . ?ƒ))
                   boogie-friends-symbols-alist))
  )
