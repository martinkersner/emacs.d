;;; Python --- Packages related to Python development

;;
(use-package pyvenv
  :ensure t)
(setq pyvenv-virtualenvwrapper-python "python3")
(pyvenv-workon "emacs")

;; LSP
(use-package lsp-mode
  :ensure t
  :hook (python-mode . lsp)
  :commands lsp
  :config
  (setq lsp-prefer-flymake nil))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp))))

(setq python-indent-offset 4)
(setq python-indent-guess-indent-offset nil)

;; isort
(use-package py-isort
  :ensure t)

(use-package py-autopep8
  :ensure t
  :hook (python-mode . py-autopep8-mode)
  :config
  (setq py-autopep8-options '("--select" "E302,E303,E305")))

;; Hooks for Python mode
(add-hook 'python-mode-hook
          (lambda ()
            ;; Add these hooks buffer-locally on Python buffers only
            (add-hook 'before-save-hook 'py-isort-before-save nil t)
            (add-hook 'before-save-hook 'py-autopep8-before-save nil t)))

(setq lsp-diagnostics-provider :none)
