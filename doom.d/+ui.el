;;; ~/.dotfiles/doom.d/+ui.el -*- lexical-binding: t; -*-


(setq doom-font (font-spec :family "LiterationMono NF" :size 18)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 16)
      doom-unicode-font (font-spec :family "WenQuanYi Micro Hei" :size 16))
;; disable line numbers at all
(setq display-line-numbers-type nil)

(after! doom-modeline
  (setq doom-modeline-major-mode-icon t))

(setq doom-theme 'doom-tomorrow-day)

(after! winner
  (winum-mode))

;; keymappings
(after! winum
  (map! :leader
        "0" 'winum-select-window-0-or-10
        "1" 'winum-select-window-1
        "2" 'winum-select-window-2
        "3" 'winum-select-window-3
        "4" 'winum-select-window-4
        "5" 'winum-select-window-5
        "6" 'winum-select-window-6
        "7" 'winum-select-window-7
        "8" 'split-window-below
        "9" 'split-window-right))

(use-package! all-the-icons-ivy-rich
  :after ivy-rich
  :init (all-the-icons-ivy-rich-mode 1))
