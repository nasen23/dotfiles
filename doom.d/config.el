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
(load! "+rust")
(load! "+java")
(load! "+python")

;; tool
(load! "+telega")

;; latex
(setq-default TeX-engine 'xetex
              TeX-PDF-mode t)

(after! company
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2))

;; http-proxy
(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
     ("http" . "localhost:8888")
     ("https" . "localhost:8888")))
