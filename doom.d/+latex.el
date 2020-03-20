;;; ~/.dotfiles/doom.d/+latex.el -*- lexical-binding: t; -*-

;; latex
(setq-default TeX-engine 'xetex
              TeX-PDF-mode t)

(add-hook! 'TeX-mode-hook 'magic-latex-buffer)
