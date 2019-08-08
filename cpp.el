;; C++ ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(global-set-key (kbd "<f5>") 'compile)
;; indent curly braces same as parent statement
(setq c-default-style "linux" c-basic-offset 4)

;; Flycheck ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (ensure-package-installed 'flycheck)
;; (use-package flycheck
;;   :ensure t
;;   :init (global-flycheck-mode))

;; Keep macros indented as the code around
;; C-c C-o
;; cpp-macro
;; 0
(c-set-offset (quote cpp-macro) 0 nil)

;; cmake
(use-package cmake-mode
  :ensure t)

;; helm-gtags
(use-package helm-gtags
  :ensure t)

(setq
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 helm-gtags-prefix-key "\C-cg"
 helm-gtags-suggested-key-mapping t
 )

;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(require 'helm-gtags)
(define-key helm-gtags-mode-map (kbd "C-c g a") 'helm-gtags-tags-in-this-function)
;; (define-key helm-gtags-mode-map (kbd "C-j") 'helm-gtags-select)
(define-key helm-gtags-mode-map (kbd "M-.") 'helm-gtags-dwim)
(define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
(define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
(define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)

(eval-after-load 'helm-gtags
  '(progn
     (evil-make-overriding-map helm-gtags-mode-map 'normal)
     ;; force update evil keymaps after ggtags-mode loaded
     (add-hook 'ggtags-mode-hook #'evil-normalize-keymaps)))


;; Compile
(setq compilation-scroll-output t)
