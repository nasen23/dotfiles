;;; ~/.dotfiles/doom.d/+java.el -*- lexical-binding: t; -*-


(use-package! lsp-java
  :after lsp-clients
  :init
  (add-hook 'java-mode-local-vars-hook #'lsp!)
  (setq lsp-java-server-install-dir (concat
                                     (file-name-as-directory
                                      (string-trim
                                       (shell-command-to-string "fd -d 1 redhat.java ~/.vscode-oss/extensions/")))
                                     "server")
        lsp-java-workspace-dir (concat doom-etc-dir "java-workspace"))
  )

