;; (setq solidity-comment-style 'slash)

;; (setq solidity-solc-path "/opt/homebrew/bin/solcjs")
;; (setq solidity-flycheck-solc-checker-active t)

;; (use-package solidity-flycheck
;;   :ensure t)
;; (require 'solidity-flycheck)

(use-package solidity-mode
  :ensure t)
(require 'solidity-mode)

;; (use-package solidity-flycheck
;;     :hook solidity-mode
;;     :config
;;     (setq solidity-solc-path "/opt/homebrew/bin/solcjs")
;;     )

(use-package dumb-jump
  :ensure t)
(require 'dumb-jump)
(add-hook 'xref-backend-functions #'dumb-jump-xref-activate)
(setq xref-show-definitions-function #'xref-show-definitions-completing-read)
(setq xref-prompt-for-identifier nil)
(setq xref-auto-jump-to-first-xref nil)

;; (use-package company-solidity
;;   :ensure t)
;; (require 'company-solidity)
;; (add-hook 'solidity-mode-hook
;; 	(lambda ()
;; 	  (set (make-local-variable 'company-backends)
;;                (append '((company-solidity company-capf company-dabbrev-code))
;; 			company-backends))))
;; (add-hook 'after-init-hook 'global-company-mode)


(defun format-solidity ()
  (when (eq major-mode 'solidity-mode)
    (shell-command (format "forge fmt %s" buffer-file-name))
    (revert-buffer :ignore-auto :noconfirm)
    )
  )

(add-hook 'before-save-hook #'format-solidity)
