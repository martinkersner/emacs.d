;; Enable pasting from clipboard
(setq x-select-enable-clipboard t)
(global-set-key (kbd "C-S-p") 'x-clipboard-yank)

; Enable CTRL-u for going upward
; Must be run before loading evil mode
; Evil mode is loaded even in evil-leader
(setq evil-want-C-u-scroll t)

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

;; Treat an Emacs symbol as a word
(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol))

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

;; helm-ag
(ensure-package-installed 'helm-ag)
