(use-package rust-mode
  :ensure t)

;; Start LSP Mode
(add-hook 'rust-mode-hook 'lsp-deferred)
