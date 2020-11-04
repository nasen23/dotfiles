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
;; (load! "+java")
(load! "+latex")
(load! "+python")
;; (load! "+boogie")

;; tool
;; (load! "+mu4e")
;; (load! "+term")
;; (load! "+telega")

(defun open-alacritty ()
  "Open alacritty."
  (interactive)
  (let ((terminal "alacritty"))
    (start-process terminal nil terminal "--working-directory"
                   (expand-file-name "./"))))

(defun silicon (beg end)
  "Use silicon to get a beautiful image of source code."
  (interactive (if (use-region-p)
                   (list (region-beginning) (region-end))
                 (list (point-min) (point-max))))
  (when (< beg end)
    (let ((filename (concat
                     (expand-file-name "~/Pictures/")
                     "silicon-"
                     (format-time-string "%Y%m%d_%H%M%S")
                     ".png")))
      (shell-command-on-region beg end
                               (format "silicon -l%s -o%s -f\"%s=16\" --pad-horiz 30 --pad-vert 30"
                                       (file-name-extension (buffer-file-name))
                                       filename (font-get (face-attribute 'default :font) :family)))
      ))
  )

(map! :map company-active-map "TAB" nil
      "<tab>" nil)

(map! :leader
      :nv :desc "Open alacritty" "o t"  #'open-alacritty)

;; why has doom stopped using this config
(add-hook! text-mode #'auto-fill-mode)

;; (setq gc-cons-threshold 100000000
;;       read-process-output-max (* 1024 1024))

;; using font cache
;; (setq inhibit-compacting-font-caches t)

(after! company
  (setq company-idle-delay 0))

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil))

(after! plantuml
  (setq plantuml-jar-path (expand-file-name "~/tools/plantuml.jar")))

;; auto refresh dired buffer
(add-hook! 'dired-mode-hook 'auto-revert-mode)

(after! ivy
  (setq all-the-icons-ivy-rich-icon-size 0.9))

;; (set-company-backend! 'prog-mode '(:separate company-tabnine company-files company-yasnippet))
;; (setq +lsp-company-backends '())
