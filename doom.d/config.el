;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "Sen Na"
      user-mail-address "i@nasen.xyz")


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
;; (load! "+boogie")

;; tool
(load! "+mu4e")
;; (load! "+term")
;; (load! "+telega")

(defun open-alacritty ()
  "Open alacritty."
  (interactive)
  (let ((terminal "alacritty"))
    (start-process terminal nil terminal "--working-directory"
                   (expand-file-name "./"))))

(map! :leader
      :nv :desc "Open alacritty" "o t"  #'open-alacritty)

;; why has doom stopped using this config
(add-hook! text-mode #'auto-fill-mode)

;; using font cache
(setq inhibit-compacting-font-caches t)

(after! company
  (setq company-idle-delay 0.1
        company-minimum-prefix-length 2))

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil))

(after! plantuml
  (setq plantuml-jar-path (expand-file-name "~/tools/plantuml.jar")))

;; auto refresh dired buffer
(add-hook! 'dired-mode-hook 'auto-revert-mode)

(after! ivy
  (setq all-the-icons-ivy-rich-icon-size 0.9))

;; http-proxy
(setq url-proxy-services
   '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
     ("http" . "localhost:8888")
     ("https" . "localhost:8888")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(italic ((t (:slant normal)))))
