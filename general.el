;; Enable pasting from clipboard
(setq x-select-enable-clipboard t)
(global-set-key (kbd "C-S-p") 'x-clipboard-yank)

;; Don't make backup files
(setq make-backup-files nil)

;; Remove trailing whitespace before saving buffer
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Path completition
(global-set-key (kbd "C-c c p") 'comint-dynamic-complete-filename)

;; Open file under cursor
;; Similar to =gf= in vim
;; M-x ffap
(ffap-bindings)

;; Keep search highlighted
;; TODO add to leader-space M-x lazy-highlight-cleanup
(setq lazy-highlight-cleanup nil)

;; Maximize buffer
;; https://gist.github.com/mads-hartmann/3402786
;; FIXME clashes with python mode
(defun toggle-maximize-buffer ()
  (interactive)
  (if (= 1 (length (window-list)))
      (jump-to-register '_)
    (progn
      (window-configuration-to-register '_)
      (delete-other-windows))))
(global-set-key (kbd "C-c C-z") 'toggle-maximize-buffer)


;; Follow symlinks without questioning
(setq vc-follow-symlinks t)

;; Pdflatex for MacOS
(getenv "PATH")
 (setenv "PATH"
(concat
 "/Library/TeX/texbin" ":"

(getenv "PATH")))

;; TIPS ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Windows
;; Rebalance windows: C-c =

;; Bookmarks (can jump between file, unlike vim)
;; TODO Bookmark highlighting
;; Register a bookmark at current line and savce it to =r=
;; C-x r <space> r
;; Jump to a bookmark define under name =r=
;; C-x r j r

;; Display remote file ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun org-global-props (&optional property buffer)
  "Get the plists of global org properties of current buffer."
  (with-current-buffer (or buffer (current-buffer))
    (org-element-map (org-element-parse-buffer) 'keyword (lambda (el) (when (string-match property (org-element-property :key el)) el)))))

;; Access property value defined in org-mode
;; Example (org-property-value "CONNECTION")
(defun org-property-value (property-name)
  (org-element-property :value (car (org-global-props property-name))))


;; Don't use TABs, use SPACEs instead
(setq-default indent-tabs-mode nil)

;; Helm semantic-mode
;; helm-semantic-or-imenu
(semantic-mode 1)
(setq helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)
(global-set-key (kbd "C-x p") 'helm-semantic-or-imenu)

;; Include _ (underscore) as a part of word
;; Before * (asterisk search) did not work for words with underscore at the front of the word
(modify-syntax-entry ?_ "w")

;; dired-git-info
(use-package dired-git-info
  :ensure t)
(with-eval-after-load 'dired
  (define-key dired-mode-map ")" 'dired-git-info-mode))

;; helm-ag
(ensure-package-installed 'helm-ag)
(global-set-key (kbd "C-c a g") 'helm-projectile-ag)

;; Don't ask if modified file on the disk should be reread
(global-auto-revert-mode 1)

;; git-gutter show changes from git
(use-package git-gutter
  :ensure t)
(global-git-gutter-mode +1)

;; yaml-mode
(use-package yaml-mode
  :ensure t)
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

;; show cursor position within line
(column-number-mode 1)

;; hippie
(global-set-key [remap dabbrev-expand] 'hippie-expand)

;; expand-region
(use-package expand-region
  :ensure t)
(global-set-key (kbd "C-=") 'er/expand-region)

;; projectile-find-other-file
(global-set-key (kbd "C-c o") 'projectile-find-other-file)

;; iy-go-to-char
(use-package iy-go-to-char
  :ensure t)
(global-set-key (kbd "C-c f") 'iy-go-to-char)
(global-set-key (kbd "C-c F") 'iy-go-to-char-backward)
