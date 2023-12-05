(use-package vertico
  :config
  (vertico-mode t))

(use-package orderless
  :config
  (setq completion-styles '(orderless)))

(use-package embark)
(use-package consult
  :config
  (global-set-key [rebind switch-to-buffer] #'consult-buffer))

(provide 'init-completion)
