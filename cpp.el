;; C++ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<f5>") 'compile)
;; indent curly braces same as parent statement
(setq c-default-style "linux" c-basic-offset 4)

;; Flycheck ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(ensure-package-installed 'flycheck)
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
