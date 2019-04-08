;; Disable the splash screen
(setq inhibit-splash-screen t)

;; Smart-mode-line ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(use-package smart-mode-line
  :ensure t)
(setq powerline-arrow-shape 'curve)
(setq powerline-default-separator-dir '(right . left))
(setq sml/theme 'dark)
(sml/setup)

(global-linum-mode t)
(setq linum-format "%d ")
(menu-bar-mode -1)
(tool-bar-mode -1)
(load-theme 'manoj-dark)
(toggle-scroll-bar -1)
(global-hl-line-mode +1)
(set-face-underline-p 'highlight nil)

;; Make left and righ fringe 1px
(set-fringe-mode '(1 . 1))

;; Transparency
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))
(defun toggle-transparency ()
   (interactive)
   (let ((alpha (frame-parameter nil 'alpha)))
     (set-frame-parameter
      nil 'alpha
      (if (eql (cond ((numberp alpha) alpha)
                     ((numberp (cdr alpha)) (cdr alpha))
                     ;; Also handle undocumented (<active> <inactive>) form.
                     ((numberp (cadr alpha)) (cadr alpha)))
               100)
          '(85 . 50) '(100 . 100)))))
 (global-set-key (kbd "C-c t") 'toggle-transparency)

;; Linum-relative ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; relative line numbers
(use-package linum-relative
  :ensure t)
(linum-relative-mode)
(setq linum-relative-current-symbol "")
