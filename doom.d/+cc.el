;;; ~/.dotfiles/doom.d/+cc.el -*- lexical-binding: t; -*-


(use-package! ccls
  :config
  (setq ccls-executable "/usr/bin/ccls")
  (setq ccls-sem-highlight-method 'font-lock)
  (ccls-use-default-rainbow-sem-highlight))
