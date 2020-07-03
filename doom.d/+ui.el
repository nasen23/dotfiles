;;; ~/.dotfiles/doom.d/+ui.el -*- lexical-binding: t; -*-


(setq doom-font (font-spec :family "JetBrains Mono" :size 16)
      doom-unicode-font (font-spec :family "Sarasa Mono SC" :size 16)
      doom-variable-pitch-font (font-spec :family "IBM Plex Sans" :size 16))

(when (display-graphic-p)
  (when (member "Noto Color Emoji" (font-family-list))
  (set-fontset-font 't 'symbol (font-spec :family "Noto Color Emoji" :size 15) nil 'prepend)))


;; disable line numbers at all
;; (setq display-line-numbers-type nil)

(after! doom-modeline
  (setq doom-modeline-icon t
        doom-modeline-major-mode-icon t
        doom-modeline-major-mode-color-icon t
        doom-modeline-buffer-state-icon t
        doom-modeline-buffer-modification-icon t
        doom-modeline-enable-word-count t
        doom-modeline-indent-info t
        doom-modeline-mu4e t))

(use-package! doom-themes
  :init
  (setq doom-theme 'doom-moonlight
        fancy-splash-image "~/.doom.d/banner/colorful.png"))

;; leave some space on left and right border
;; (define-globalized-minor-mode global-fringe-mode fringe-mode
;;   (lambda () (fringe-mode '(12 . 12))))

;; (global-fringe-mode 1)

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

(setq +pretty-code-enabled-modes '(not c-mode
                                       not js2-mode
                                       not c++-mode
                                       not python-mode
                                       not rjsx-mode
                                       not typescript-mode))

(use-package! nyan-mode
  :after doom-modeline
  :init
  (setq nyan-animate-nyancat t
        nyan-wavy-trail t)
  (nyan-mode t))

(use-package! all-the-icons-ivy-rich
  :after ivy-rich
  :init (all-the-icons-ivy-rich-mode 1))
