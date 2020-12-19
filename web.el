(use-package vue-mode
  :ensure t)

(add-hook 'mmm-mode-hook
          (lambda ()
            (set-face-background 'mmm-default-submode-face nil)))

(setq mmm-js-mode-enter-hook (lambda () (setq syntax-ppss-table nil)))
(setq mmm-typescript-mode-enter-hook (lambda () (setq syntax-ppss-table nil)))

(setq js-indent-level 2)

(use-package vue-html-mode
  :ensure t)

;;; html+css autocomplete
(use-package emmet-mode
  :ensure t)
(setq emmet-move-cursor-between-quotes t)
