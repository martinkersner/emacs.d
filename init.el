(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))

; Activate installed packages
(package-initialize)

(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

; User defined lisp functions are stored in lisp directory
(add-to-list 'load-path "~/.emacs.d/lisp/")

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(solidity-flycheck graphql-mode rust-mode flymake-solidity prettier-js svelte-mode web-mode tide pyvenv-mode nginx-mode solidity-mode lsp-dart dart-mode lsp-mode emmet-mode elixir-mode helm-gtags cmake-mode py-isort elpy yasnippet-snippets yaml-mode use-package try smart-mode-line shader-mode pyvenv org-download org-bullets neotree multiple-cursors markdown-mode magit helm-projectile helm-ag git-gutter flycheck firestarter expand-region dockerfile-mode dired-git-info ag ace-jump-mode)))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))

(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))

;; Use-package ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(ensure-package-installed 'use-package)

;; try
(use-package try
  :ensure t)

(setq load-prefer-newer t)

;; Modules
(load-user-file "pretty.el")
(load-user-file "host.el")
(load-user-file "general.el")
(load-user-file "etc.el")
(load-user-file "py.el")
(load-user-file "cpp.el")
;; (load-user-file "elixir.el")
(load-user-file "web.el")
(load-user-file "app-dev.el")
(load-user-file "web3.el")
(load-user-file "server.el")
(load-user-file "rust.el")

;; Abbreavitions
(load-user-file "lisp/abbrev.el")
(put 'scroll-left 'disabled nil)
