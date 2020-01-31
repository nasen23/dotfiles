;;; ~/.dotfiles/doom.d/+ui.el -*- lexical-binding: t; -*-


(setq doom-font (font-spec :family "InconsolataLGC Nerd Font" :size 16)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 15)
      doom-unicode-font (font-spec :family "WenQuanYi Micro Hei"))
(setq +doom-dashboard-banner-file "kaguya.png"
      +doom-dashboard-banner-dir "~/Pictures/avatar/")

(use-package! doom-modeline
  :config
  (setq doom-modeline-major-mode-icon t))

(use-package! doom-themes
  :config
  (setq doom-themes-enable-bold t
        doom-themes-enable-italic nil)
  (load-theme 'doom-one-light t)
  (setq doom-themes-treemacs-theme "doom-colors")
  (doom-themes-treemacs-config)
  (doom-themes-org-config)
  )

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
