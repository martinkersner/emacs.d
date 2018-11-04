;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

; Activate installed packages
(package-initialize)

(defun ensure-package-installed (&rest packages)
  "Assure every package is installed, ask for installation if it’s not.
   Return a list of installed packages or nil for every skipped package."
  (mapcar
   (lambda (package)
     (if (package-installed-p package)
         nil
       (if (y-or-n-p (format "Package %s is missing. Install it? " package))
           (package-install package)
         package)))
   packages))

(or (file-exists-p package-user-dir)
    (package-refresh-contents))

; Install required packages
(ensure-package-installed
  'evil-leader
  'evil
  'magit
  'org
  'org-download
  'org-bullets
  'multiple-cursors
  'neotree
  'smart-mode-line
  'smart-mode-line-powerline-theme
  'tramp
  'virtualenvwrapper
  'ag
  'projectile
  'linum-relative
  'highlight
  'elpy
  'yasnippet
  'yasnippet-snippets
  )

; Disable the splash screen
(setq inhibit-splash-screen t)

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
;; treat an Emacs symbol as a word
(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol))
;; keep search highlighted
;; TODO add to leader-space M-x lazy-highlight-cleanup
(setq lazy-highlight-cleanup nil)

; magit
(require 'magit)

; org mode
(require 'org)
(require 'org-download)
(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
(setq org-image-actual-width nil)
(setq org-todo-keywords
  '((sequence "TODO" "INPROGRESS" "|" "DONE" "HALTED")))
(define-key org-mode-map (kbd "C-c C-v") 'org-show-todo-tree)
(define-key org-mode-map (kbd "C-c a") 'org-agenda)


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

(define-key evil-normal-state-map (kbd "C-h") #'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") #'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") #'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") #'evil-window-right)

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

; FILE MANAGEMENT
;; don't make backup files
(setq make-backup-files nil)

;; PRETTIFY EMACS
(require 'smart-mode-line)
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
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))
(add-to-list 'default-frame-alist '(alpha . (85 . 50)))
(set-fringe-mode '(1 . 1)) ; make left and righ fringe 1px
(set-face-attribute 'default nil :height 80) ; set height of default font to 80
;; Maximize buffer
;; https://gist.github.com/mads-hartmann/3402786
(defun toggle-maximize-buffer ()
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))
(global-set-key (kbd "C-c C-z") 'toggle-maximize-buffer)

; tramp
(require 'tramp)
(setq tramp-default-method "ssh")
(setq-default explicit-shell-file-name "/bin/bash")
(setq tramp-shell-prompt-pattern "^[^$>\n]*[#$%>] *\\(\[[0-9;]*[a-zA-Z] *\\)*")
(setq tramp-verbose 10)

;; utilities
(setq vc-follow-symlinks t) ; follow symlinks without questioning

(require 'ox-latex)
(add-to-list 'org-latex-classes
             '("beamer"
               "\\documentclass\[presentation\]\{beamer\}"
               ("\\section\{%s\}" . "\\section*\{%s\}")
               ("\\subsection\{%s\}" . "\\subsection*\{%s\}")
               ("\\subsubsection\{%s\}" . "\\subsubsection*\{%s\}")))


; display remote file
(defun org-global-props (&optional property buffer)
  "Get the plists of global org properties of current buffer."
  (with-current-buffer (or buffer (current-buffer))
    (org-element-map (org-element-parse-buffer) 'keyword (lambda (el) (when (string-match property (org-element-property :key el)) el)))))

(defun org-property-value (property-name)
  (org-element-property :value (car (org-global-props property-name))))

(defun open-with-tramp ()
  (interactive)
  (let ((filename (buffer-substring-no-properties (line-beginning-position) (line-end-position))))
    (org-element-property :value (car (org-global-props "CONNECTION")))
    (find-file-other-window
     (concat
      "/"
      (org-property-value "CONNECTION")
      ":"
      (org-property-value "SERVER")
      ":"
      (org-property-value "ROOT_DIR")
      filename))
    (evil-window-prev 1)
    ))

(define-key org-mode-map (kbd "C-c o") 'open-with-tramp)

; python virtual environment
(require 'virtualenvwrapper)
(venv-initialize-interactive-shells) ;; if you want interactive shell support
(venv-initialize-eshell) ;; if you want eshell support
;; note that setting `venv-location` is not necessary if you
;; use the default location (`~/.virtualenvs`), or if the
;; the environment variable `WORKON_HOME` points to the right place
(setq venv-location "/home/martin/.virtualenvs")

; TOOLS
; AG
; M-x ag-project
(require 'ag)

; PROJECTILE
; C-c p f
(require 'projectile)
(projectile-mode +1)
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

; Enable to run python code in org-file
(org-babel-do-load-languages
 'org-babel-load-languages '((python . t)))

;; Insert debug line to Python
(defun my/debug-python ()
  (interactive)
  (indent-relative)
  (insert "from IPython import embed; embed();  # TODO debug")
  )
(define-key evil-normal-state-map (kbd "C-c C-d") #'my/debug-python)

;; pdflatex for MacOS
(getenv "PATH")
 (setenv "PATH"
(concat
 "/Library/TeX/texbin" ":"

(getenv "PATH")))

;; reveal
(require 'ox-reveal)

;; relative numbers
(require 'linum-relative)
(linum-relative-mode)
(setq linum-relative-current-symbol "")

;; remove trainling whitespace before saving buffer
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Python
(require 'elpy)
(elpy-enable)
(setq python-shell-completion-native-enable nil)
(setq elpy-shell-echo-input nil)
(define-key python-mode-map (kbd "C-]") #'elpy-goto-definition)
(elpy-set-test-runner #'elpy-test-pytest-runner)


;; abbreavitions
(load "~/.emacs.d/lisp/abbrev.el")


;; snippets
(require 'yasnippet)
(require 'yasnippet-snippets)
(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)
