;;; ~/.dotfiles/doom.d/+cc.el -*- lexical-binding: t; -*-


(after! ccls
  (setq ccls-executable "/usr/bin/ccls"))

(after! cc-mode
  (setq c-basic-offset 2)
  (c-set-offset 'innamespace '-)
  (c-set-offset 'access-label '--)
  (c-set-offset 'inclass '+))

