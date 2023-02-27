;;; html+css autocomplete
(use-package emmet-mode
  :ensure t)
(setq emmet-move-cursor-between-quotes t)

(use-package typescript-mode
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

(use-package tide
  :ensure t)
(use-package company :ensure t)
;; (use-package flycheck :ensure t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(use-package web-mode
  :ensure t)
(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.mjs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.cts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "ts" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

;; enable typescript - tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

;; js
(use-package prettier-js
  :ensure t)
(require 'prettier-js)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
