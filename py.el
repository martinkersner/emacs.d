;;; Python --- Packages related to Python development

(use-package pyvenv
  :ensure t)

(setq pyvenv-virtualenvwrapper-python "python3")

(pyvenv-workon "emacs")

;; Elpy
(use-package elpy
  :ensure t)
(elpy-enable)

;; isort
(use-package py-isort
  :ensure t)
(require 'py-isort)

(add-hook 'elpy-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'py-isort-before-save)
            (add-hook 'before-save-hook 'elpy-black-fix-code nil t)
            ))
