;; C++ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<f5>") 'compile)
;; indent curly braces same as parent statement
(setq c-default-style "linux" c-basic-offset 4)

;; Flycheck ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(ensure-package-installed 'flycheck)
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Keep macros indented as the code around
;; C-c C-o
;; cpp-macro
;; 0
(c-set-offset (quote cpp-macro) 0 nil)
