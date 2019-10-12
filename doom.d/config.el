;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "Sen Na"
      user-mail-address "nasen2582995949@163.com")

(setq-default evil-shift-width 4
              tab-width 4)

(setq doom-font (font-spec :family "Hack" :size 16))
(setq doom-variable-pitch-font (font-spec :family "Cantarell" :size 15 :style "Bold"))
(setq +doom-dashboard-banner-file "kaguya.png"
      +doom-dashboard-banner-dir "~/Pictures/avatar/")

(define-key evil-normal-state-map (kbd "J") (kbd "5 j"))
(define-key evil-normal-state-map (kbd "K") (kbd "5 k"))
(define-key evil-normal-state-map (kbd "H") (kbd "5 h"))
(define-key evil-normal-state-map (kbd "L") (kbd "5 l"))

(define-key evil-visual-state-map (kbd "J") (kbd "5 j"))
(define-key evil-visual-state-map (kbd "K") (kbd "5 k"))
(define-key evil-visual-state-map (kbd "H") (kbd "5 h"))
(define-key evil-visual-state-map (kbd "L") (kbd "5 l"))

(add-hook 'java-mode-hook #'lsp)
(require 'dap-gdb-lldb)
(require 'doom-themes)
;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic nil) ; if nil, italics is universally disabled

;; Load the theme (doom-one, doom-molokai, etc); keep in mind that each theme
;; may have their own settings.
(load-theme 'doom-palenight t)

;; Enable flashing mode-line on errors
;; (doom-themes-visual-bell-config)

;; Enable custom neotree theme (all-the-icons must be installed!)
;; (doom-themes-neotree-config)
;; or for treemacs users
(setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
(doom-themes-treemacs-config)

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

(def-package! nyan-mode
  :config
  (nyan-mode 1)
  (nyan-start-animation)
)

(def-package! lsp-ui :commands lsp-ui-mode)

(def-package! dap-mode
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(def-package! dap-java :after (lsp-java))

(def-package! web-mode
  :mode ("\\.vue\\'"))

(def-package! company-box
      :diminish
      :functions (my-company-box--make-line
                  my-company-box-icons--elisp)
      :commands (company-box--get-color
                 company-box--resolve-colors
                 company-box--add-icon
                 company-box--apply-color
                 company-box--make-line
                 company-box-icons--elisp)
      :hook (company-mode . company-box-mode)
      :init (setq company-box-backends-colors nil
                  company-box-show-single-candidate t
                  company-box-max-candidates 50
                  company-box-doc-enable nil)
      :config
      ;; Support `company-common'
      (defun my-company-box--make-line (candidate)
        (-let* (((candidate annotation len-c len-a backend) candidate)
                (color (company-box--get-color backend))
                ((c-color a-color i-color s-color) (company-box--resolve-colors color))
                (icon-string (and company-box--with-icons-p (company-box--add-icon candidate)))
                (candidate-string (concat (propertize (or company-common "") 'face 'company-tooltip-common)
                                          (substring (propertize candidate 'face 'company-box-candidate) (length company-common) nil)))
                (align-string (when annotation
                                (concat " " (and company-tooltip-align-annotations
                                                 (propertize " " 'display `(space :align-to (- right-fringe ,(or len-a 0) 1)))))))
                (space company-box--space)
                (icon-p company-box-enable-icon)
                (annotation-string (and annotation (propertize annotation 'face 'company-box-annotation)))
                (line (concat (unless (or (and (= space 2) icon-p) (= space 0))
                                (propertize " " 'display `(space :width ,(if (or (= space 1) (not icon-p)) 1 0.75))))
                              (company-box--apply-color icon-string i-color)
                              (company-box--apply-color candidate-string c-color)
                              align-string
                              (company-box--apply-color annotation-string a-color)))
                (len (length line)))
          (add-text-properties 0 len (list 'company-box--len (+ len-c len-a)
                                           'company-box--color s-color)
                               line)
          line))
      (advice-add #'company-box--make-line :override #'my-company-box--make-line)

      ;; Prettify icons
      (defun my-company-box-icons--elisp (candidate)
        (when (derived-mode-p 'emacs-lisp-mode)
          (let ((sym (intern candidate)))
            (cond ((fboundp sym) 'Function)
                  ((featurep sym) 'Module)
                  ((facep sym) 'Color)
                  ((boundp sym) 'Variable)
                  ((symbolp sym) 'Text)
                  (t . nil)))))
      (advice-add #'company-box-icons--elisp :override #'my-company-box-icons--elisp)

      (when (and (display-graphic-p)
                 (require 'all-the-icons nil t))
        (declare-function all-the-icons-faicon 'all-the-icons)
        (declare-function all-the-icons-material 'all-the-icons)
        (declare-function all-the-icons-octicon 'all-the-icons)
        (setq company-box-icons-all-the-icons
              `((Unknown . ,(all-the-icons-material "find_in_page" :height 0.85 :v-adjust -0.2))
                (Text . ,(all-the-icons-faicon "text-width" :height 0.8 :v-adjust -0.05))
                (Method . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.05 :face 'all-the-icons-purple))
                (Function . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.05 :face 'all-the-icons-purple))
                (Constructor . ,(all-the-icons-faicon "cube" :height 0.8 :v-adjust -0.05 :face 'all-the-icons-purple))
                (Field . ,(all-the-icons-octicon "tag" :height 0.8 :v-adjust 0 :face 'all-the-icons-lblue))
                (Variable . ,(all-the-icons-octicon "tag" :height 0.8 :v-adjust 0 :face 'all-the-icons-lblue))
                (Class . ,(all-the-icons-material "settings_input_component" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-orange))
                (Interface . ,(all-the-icons-material "share" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
                (Module . ,(all-the-icons-material "view_module" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
                (Property . ,(all-the-icons-faicon "wrench" :height 0.8 :v-adjust -0.05))
                (Unit . ,(all-the-icons-material "settings_system_daydream" :height 0.85 :v-adjust -0.2))
                (Value . ,(all-the-icons-material "format_align_right" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
                (Enum . ,(all-the-icons-material "storage" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-orange))
                (Keyword . ,(all-the-icons-material "filter_center_focus" :height 0.85 :v-adjust -0.2))
                (Snippet . ,(all-the-icons-material "format_align_center" :height 0.85 :v-adjust -0.2))
                (Color . ,(all-the-icons-material "palette" :height 0.85 :v-adjust -0.2))
                (File . ,(all-the-icons-faicon "file-o" :height 0.85 :v-adjust -0.05))
                (Reference . ,(all-the-icons-material "collections_bookmark" :height 0.85 :v-adjust -0.2))
                (Folder . ,(all-the-icons-faicon "folder-open" :height 0.85 :v-adjust -0.05))
                (EnumMember . ,(all-the-icons-material "format_align_right" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-lblue))
                (Constant . ,(all-the-icons-faicon "square-o" :height 0.85 :v-adjust -0.05))
                (Struct . ,(all-the-icons-material "settings_input_component" :height 0.85 :v-adjust -0.2 :face 'all-the-icons-orange))
                (Event . ,(all-the-icons-faicon "bolt" :height 0.8 :v-adjust -0.05 :face 'all-the-icons-orange))
                (Operator . ,(all-the-icons-material "control_point" :height 0.85 :v-adjust -0.2))
                (TypeParameter . ,(all-the-icons-faicon "arrows" :height 0.8 :v-adjust -0.05))
                (Template . ,(all-the-icons-material "format_align_center" :height 0.85 :v-adjust -0.2)))
              company-box-icons-alist 'company-box-icons-all-the-icons)))
;; (defun fira-code-mode--make-alist (list)
;;   "Generate prettify-symbols alist from LIST."
;;   (let ((idx -1))
;;     (mapcar
;;      (lambda (s)
;;        (setq idx (1+ idx))
;;        (let* ((code (+ #Xe100 idx))
;;           (width (string-width s))
;;           (prefix ())
;;           (suffix '(?\s (Br . Br)))
;;           (n 1))
;;      (while (< n width)
;;        (setq prefix (append prefix '(?\s (Br . Bl))))
;;        (setq n (1+ n)))
;;      (cons s (append prefix suffix (list (decode-char 'ucs code))))))
;;      list)))

;; (defconst fira-code-mode--ligatures
;;   '("www" "**" "***" "**/" "*>" "*/" "\\\\" "\\\\\\"
;;     "{-" "[]" "::" ":::" ":=" "!!" "!=" "!==" "-}"
;;     "--" "---" "-->" "->" "->>" "-<" "-<<" "-~"
;;     "#{" "#[" "##" "###" "####" "#(" "#?" "#_" "#_("
;;     ".-" ".=" ".." "..<" "..." "?=" "??" ";;" "/*"
;;     "/**" "/=" "/==" "/>" "//" "///" "&&" "||" "||="
;;     "|=" "|>" "^=" "$>" "++" "+++" "+>" "=:=" "=="
;;     "===" "==>" "=>" "=>>" "<=" "=<<" "=/=" ">-" ">="
;;     ">=>" ">>" ">>-" ">>=" ">>>" "<*" "<*>" "<|" "<|>"
;;     "<$" "<$>" "<!--" "<-" "<--" "<->" "<+" "<+>" "<="
;;     "<==" "<=>" "<=<" "<>" "<<" "<<-" "<<=" "<<<" "<~"
;;     "<~~" "</" "</>" "~@" "~-" "~=" "~>" "~~" "~~>" "%%"
;;     "x" ":" "+" "+" "*"))

;; (defvar fira-code-mode--old-prettify-alist)

;; (defun fira-code-mode--enable ()
;;   "Enable Fira Code ligatures in current buffer."
;;   (setq-local fira-code-mode--old-prettify-alist prettify-symbols-alist)
;;   (setq-local prettify-symbols-alist (append (fira-code-mode--make-alist fira-code-mode--ligatures) fira-code-mode--old-prettify-alist))
;;   (prettify-symbols-mode t))

;; (defun fira-code-mode--disable ()
;;   "Disable Fira Code ligatures in current buffer."
;;   (setq-local prettify-symbols-alist fira-code-mode--old-prettify-alist)
;;   (prettify-symbols-mode -1))

;; (define-minor-mode fira-code-mode
;;   "Fira Code ligatures minor mode"
;;   :lighter " Fira Code"
;;   (setq-local prettify-symbols-unprettify-at-point 'right-edge)
;;   (if fira-code-mode
;;       (fira-code-mode--enable)
;;     (fira-code-mode--disable)))

;; (defun fira-code-mode--setup ()
;;   "Setup Fira Code Symbols"
;;   (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol"))

;; (define-globalized-minor-mode global-fira-code-mode fira-code-mode
;;   (lambda () (fira-code-mode 1)))

;; (global-fira-code-mode 1)
