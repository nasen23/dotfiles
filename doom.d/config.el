;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "Sen Na"
      user-mail-address "nasen2582995949@163.com")


;; ui
(load! "+ui")

;; input
(load! "+chinese")

;; lang
(load! "+cc")
(load! "+org")
(load! "+web")
(load! "+python")

;; latex
(setq-default TeX-engine 'xetex
              TeX-PDF-mode t)

(use-package! dap-mode
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package! company
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2))
