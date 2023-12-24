;;; init.el --- My Emacs configuration.	-*- lexical-binding: t no-byte-compile: t -*-

;;; Commentary:
;;
;; A sensible Emacs config with meow modal editing.
;;


;;; Code:

(org-babel-load-file
 (expand-file-name
  "config.org"
  user-emacs-directory))

;;; init.el ends here
(put 'dired-find-alternate-file 'disabled nil)
