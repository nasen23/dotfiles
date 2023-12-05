(setq user-emacs-directory ())
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file 'no-error 'no-message)

(add-to-list 'load-path "~/.config/emacs/lisp")
(require 'init-packages)
(require 'init-ui)
(require 'init-meow)
(require 'init-editor)
(require 'init-completion)

(define-key minibuffer-local-map (kbd "ESC") 'abort-recursive-edit) 
       
(global-auto-revert-mode 1)
(setq auto-save-default nil)
(setq ring-bell-function 'ignore)
(fset 'yes-or-no-p 'y-or-n-p)
 
(icomplete-mode 1)

(defun open-init-file()
  (interactive)
  (find-file "~/.config/emacs/init.el"))

