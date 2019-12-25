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

(use-package! js2-mode
  :config
  (setq js-indent-level 2))
