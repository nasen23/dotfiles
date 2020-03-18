;;; ~/.dotfiles/doom.d/+boogie.el -*- lexical-binding: t; -*-

(use-package! boogie-friends
  :mode ("\\.dfy\\'" . dafny-mode)
  :mode ("\\.smt2\\'" . z3-smt2-mode)
  :mode ("\\.bpl\\'" . boogie-mode)
  :config
  (add-to-list 'company-backends 'boogie-friends-snippets)
  (setq flycheck-dafny-executable "/usr/bin/dafny")
  )
