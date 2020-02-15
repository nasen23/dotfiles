;;; ~/.dotfiles/doom.d/+ui.el -*- lexical-binding: t; -*-


(setq doom-font (font-spec :family "Liberation Mono" :size 18)
      doom-variable-pitch-font (font-spec :family "Noto Sans" :size 16)
      doom-unicode-font (font-spec :family "WenQuanYi Micro Hei"))

(after! doom-modeline
  (setq doom-modeline-major-mode-icon t))

(setq doom-theme 'doom-tomorrow-day)
(setq doom-themes-enable-bold t
      doom-themes-enable-italic nil)

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
        "8" 'split-window-below
        "9" 'split-window-right))
