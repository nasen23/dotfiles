;;; ~/.dotfiles/doom.d/+python.el -*- lexical-binding: t; -*-


(use-package! lsp-python-ms
  :after python
  :config
  ;; for executable of language server, if it's not symlinked on your PATH
  (setq lsp-python-ms-executable
        "~/python-language-server/output/bin/Release/Microsoft.Python.LanguageServer")
  ;; for dev build of language server
  (setq lsp-python-ms-dir
        (file-name-directory lsp-python-ms-executable)))
