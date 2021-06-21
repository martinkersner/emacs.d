;; Mobile app development

(use-package dart-mode
  :ensure t
  :hook (dart-mode . flutter-test-mode))

(use-package flutter
  :ensure t
  :after dart-mode
  :bind (:map dart-mode-map
              ("C-M-x" . #'flutter-run-or-hot-reload)))

;; Optional
(use-package flutter-l10n-flycheck
  :ensure t
  :after flutter
  :config
  (flutter-l10n-flycheck-setup))


(use-package kotlin-mode
  :ensure t)
