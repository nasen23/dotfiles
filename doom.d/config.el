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
(load! "+latex")
(load! "+python")
(load! "+boogie")

;; tool
(load! "+telega")

(defun open-alacritty ()
  (interactive)
  (let ((terminal "alacritty"))
    (start-process terminal nil terminal "--working-directory"
                   (expand-file-name "./"))))

(map! :leader
      :nv :desc "Open alacritty" "o t"  #'open-alacritty)

;; using font cache
(setq inhibit-compacting-font-caches t)

(after! company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 2))

;; auto refresh dired buffer
(add-hook! 'dired-mode-hook 'auto-revert-mode)

(after! ivy
  (setq all-the-icons-ivy-rich-icon-size 0.9))

;; http-proxy
(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
     ("http" . "localhost:8888")
     ("https" . "localhost:8888")))
