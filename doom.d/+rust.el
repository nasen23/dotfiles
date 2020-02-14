;;; ~/.dotfiles/doom.d/+rust.el -*- lexical-binding: t; -*-

(after! rustic
  (setq lsp-rust-server 'rust-analyzer
        rustic-lsp-server 'rust-analyzer))
