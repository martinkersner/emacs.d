;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

; Disable the splash screen
(setq inhibit-splash-screen t)

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

; user defined lisp functions are stored in lisp directory
(add-to-list 'load-path "~/.emacs.d/lisp/")

; Enable CTRL-u for going upward
; Must be run before loading evil mode
; Evil mode is loaded even in evil-leader
(setq evil-want-C-u-scroll t)

; vim-like leader
; need to be defined before evil mode
(require 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-key "e" 'find-file)

; evil mode
(require 'evil)
(evil-mode 1)

; magit
(require 'magit)

; org mode
(require 'org-download)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-image-actual-width nil)
(setq org-todo-keywords
  '((sequence "TODO" "INPROGRESS" "|" "DONE" "HALTED")))

; other packages
(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

; neotree
(require 'neotree)
(global-set-key [f8] 'neotree-toggle)
;(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "R") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(custom-enabled-themes (quote (wombat)))
 '(explicit-shell-file-name "/bin/sh")
 '(package-selected-packages
   (quote
    (neotree multiple-cursors magit org-bullets org-download evil sml-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;(add-to-list 'load-path "/path/to/color-theme.el/file")
;(add-to-list 'load-path "/Users/martin/.emacs.d/color-theme-6.6.0")
;(require 'color-theme)
;(eval-after-load "color-theme"
  ;'(progn
     ;(color-theme-initialize)
     ;(color-theme-hober)))

; prettify emacs
(global-linum-mode t)
(setq linum-format "%d ")
(menu-bar-mode -1)
(tool-bar-mode -1)
(load-theme 'manoj-dark)
(toggle-scroll-bar -1)
(global-hl-line-mode +1)
(set-face-underline-p 'highlight nil)
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))
(set-fringe-mode '(1 . 1)) ; make left and righ fringe 1px
(set-face-attribute 'default nil :height 80) ; set height of default font to 80

; tramp
(require 'tramp)
(setq tramp-default-method "ssh")
(setq-default explicit-shell-file-name "/bin/bash")
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")
(setq tramp-verbose 10)

;; utilities
(setq vc-follow-symlinks t) ; follow symlinks without questioning
