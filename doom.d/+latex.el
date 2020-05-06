;;; ~/.dotfiles/doom.d/+latex.el -*- lexical-binding: t; -*-

;; latex
(setq-default TeX-engine 'xetex
              TeX-PDF-mode t)

;; (add-hook! 'tex-mode-hook 'magit-latex-buffer)

(map! :map cdlatex-mode-map
    :i "TAB" #'cdlatex-tab)
