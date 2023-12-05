(global-linum-mode 1)

(add-to-list 'default-frame-alist '(ns-transparent-titlebar . t))
(add-to-list 'default-frame-alist '(ns-appearance . dark)) 

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(tool-bar-mode -1)
(scroll-bar-mode -1)
(setq inhibit-startup-screen t)

(use-package catppuccin-theme)
(setq catppuccin-flavor 'frappe)
(load-theme 'catppuccin :no-confirm)

(add-to-list 'default-frame-alist
             '(font . "Sarasa Mono SC-14"))

(provide 'init-ui)
