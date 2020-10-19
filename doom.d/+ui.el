;;; ~/.dotfiles/doom.d/+ui.el -*- lexical-binding: t; -*-


(setq doom-font (font-spec :family "Hasklug Nerd Font" :size 16)
      doom-unicode-font (font-spec :family "Noto Serif CJK SC")
      doom-variable-pitch-font (font-spec :family "Noto Serif CJK SC" :size 17))

(set-fontset-font t 'symbol (font-spec :family "Noto Color Emoji" :size 15))

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
  (setq doom-theme 'doom-solarized-light
        fancy-splash-image "~/.doom.d/banner/colorful.png")
  :config
  (set-face-italic-p 'italic nil)
  (custom-set-faces!
    '(org-block-begin-line :background nil)
    '(org-block-end-line :background nil)
    '(outline-1 :height 1.5 :weight bold)
    '(outline-2 :height 1.3 :weight bold)
    '(outline-3 :height 1.1 :weight bold)
    '(outline-4 :weight bold))
  )

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

(after! mixed-pitch
  (pushnew! mixed-pitch-fixed-pitch-faces
            'org-special-keyword
            'org-latex-and-related
            'org-property-value
            'org-scheduled-custom
            'org-scheduled-custom-braket
            'org-ref-cite-face
            'org-list-dt
            'org-tag
            'font-lock-comment-face
            'markdown-code-face
            'markdown-comment-face
            'markdown-footnote-marker-face
            'markdown-gfm-checkbox-face
            'markdown-inline-code-face
            'markdown-language-info-face
            'markdown-language-info-properties
            'markdown-language-keyword-face
            'markdown-language-keyword-properties
            'markdown-math-face
            'markdown-markup-face
            'markdown-pre-face))

(use-package! nyan-mode
  :after doom-modeline
  :config
  (setq nyan-animate-nyancat t
        nyan-wavy-trail t)
  (nyan-mode t))

;; (use-package! poke-line
;;   :after doom-modeline
;;   :config
;;   (poke-line-set-pokemon "gengar")
;;   (poke-line-mode 1))


(use-package! all-the-icons-ivy-rich
  :after ivy-rich
  :init (all-the-icons-ivy-rich-mode 1))
