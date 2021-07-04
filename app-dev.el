;; Mobile app development

(use-package lsp-mode
  :ensure t)

(use-package dart-mode
  :ensure t)

(use-package lsp-dart
  :ensure t
  :hook (dart-mode . lsp))

(setq gc-cons-threshold (* 100 1024 1024)
      read-process-output-max (* 1024 1024)
      company-minimum-prefix-length 1
      lsp-lens-enable t
      lsp-signature-auto-activate nil)

(with-eval-after-load 'projectile
  (add-to-list 'projectile-project-root-files-bottom-up "pubspec.yaml")
  (add-to-list 'projectile-project-root-files-bottom-up "BUILD"))


(setq lsp-ui-doc-enable nil)


(add-hook 'lsp-ui-doc-frame-hook
          (lambda (frame _w)
            (set-face-attribute 'default frame :font "Terminus" :height 100)))

(global-set-key "\C-c\C-d" 'lsp-ui-doc-show)
