;; Virtualenvwrapper ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(ensure-package-installed 'virtualenvwrapper)
(require 'virtualenvwrapper)
;; if you want interactive shell support
(venv-initialize-interactive-shells)
;; if you want eshell support
(venv-initialize-eshell)


;; Elpy ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(ensure-package-installed 'elpy)
(require 'elpy)
(elpy-enable)
(setq python-shell-completion-native-enable nil)
(setq elpy-shell-echo-input nil)
(define-key python-mode-map (kbd "C-]") #'elpy-goto-definition)
(elpy-set-test-runner #'elpy-test-pytest-runner)
