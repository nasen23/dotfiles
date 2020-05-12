;;; ~/.dotfiles/doom.d/+web.el -*- lexical-binding: t; -*-


(use-package! web-mode
  :mode ("\\.vue\\'" "\\.wxml\\'")
  :config
  (setq web-mode-indent-level 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(use-package! css-mode
  :mode ("\\.wxss\\'"))

(after! js2-mode
  (setq js2-indent-level 2))

(after! typescript-mode
  (setq typescript-indent-level 2))
