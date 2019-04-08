;; Virtualenvwrapper ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package virtualenvwrapper
  :ensure t)
;; if you want interactive shell support
(venv-initialize-interactive-shells)
;; if you want eshell support
(venv-initialize-eshell)


;; Elpy ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package elpy
  :ensure t)
(elpy-enable)
(setq python-shell-completion-native-enable nil)
(setq elpy-shell-echo-input nil)
(define-key python-mode-map (kbd "C-]") #'elpy-goto-definition)
(elpy-set-test-runner #'elpy-test-pytest-runner)
