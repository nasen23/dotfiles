;;; .doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here

(setq user-full-name "Sen Na"
      user-mail-address "nasen2582995949@163.com")

;; window

(use-package! winum
  :config
  (winum-mode))

;; keymappings
(map! :leader
      "0" 'winum-select-window-0-or-10
      "1" 'winum-select-window-1
      "2" 'winum-select-window-2
      "3" 'winum-select-window-3
      "4" 'winum-select-window-4
      "8" 'split-window-below
      "9" 'split-window-right)

;; indent
(setq-default evil-shift-width 4
              tab-width 4)
(setq js-indent-level 2)

;; leetcode
(use-package! leetcode
  :config
  (setq leetcode-prefer-language "rust"))

;; fcitx
(fcitx-evil-turn-on)

;; org
(setq org-agenda-files (list "~/org"))
(setq org-latex-pdf-process
      '("xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"
        "xelatex -interaction nonstopmode -output-directory %o %f"))
(setq org-plantuml-jar-path (expand-file-name "~/tools/plantuml.jar"))
(setq org-startup-with-inline-images t)

(use-package! ox-hugo
  :after ox)

;; latex
(setq-default TeX-engine 'xetex
              TeX-PDF-mode t)

;; blog
(defun deploy-my-blog ()
  "Deploy my already generated markdown files to blog site."
  (interactive)
  (async-shell-command "~/Desktop/blog/deploy.sh"))

;; theme and font
(setq doom-font (font-spec :family "InconsolataLGC Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 15)
      doom-unicode-font (font-spec :family "WenQuanYi Micro Hei"))
(setq +doom-dashboard-banner-file "kaguya.png"
      +doom-dashboard-banner-dir "~/Pictures/avatar/")
(setq doom-modeline-major-mode-icon t)

(use-package! doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic nil)
  (load-theme 'doom-oceanic-next t)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-org-config)
  )

;; ccls
(use-package! ccls
  :config
  (setq ccls-executable "/usr/bin/ccls")
  (setq ccls-sem-highlight-method 'font-lock)
  (ccls-use-default-rainbow-sem-highlight))

;; company and lsp

(use-package! lsp-python-ms
  :demand nil
  :config
  ;; for executable of language server, if it's not symlinked on your PATH
  (setq lsp-python-ms-executable
        "~/python-language-server/output/bin/Release/Microsoft.Python.LanguageServer")
  ;; for dev build of language server
  (setq lsp-python-ms-dir
        (file-name-directory lsp-python-ms-executable)))

(use-package! dap-mode
  :after lsp-mode
  :config
  (dap-mode t)
  (dap-ui-mode t))

(use-package! web-mode
  :mode ("\\.vue\\'" "\\.wxml\\'")
  :config
  (setq web-mode-indent-level 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))

(use-package! css-mode
  :mode ("\\.wxss\\'"))

(use-package! company
  :config
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2))


;; other files
(load! "chinese-count")
