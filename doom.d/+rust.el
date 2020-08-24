;;; ~/.dotfiles/doom.d/+rust.el -*- lexical-binding: t; -*-

(use-package! rustic
  :defer t
  :init
  (setq lsp-rust-server 'rust-analyzer
        rustic-lsp-server 'rust-analyzer
        lsp-rust-clippy-preference "on"
        lsp-rust-analyzer-server-display-inlay-hints t
        lsp-rust-analyzer-display-chaining-hints t))
