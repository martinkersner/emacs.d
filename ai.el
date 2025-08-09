(use-package aidermacs
  :ensure t
  :bind (("C-c q" . aidermacs-transient-menu))
  :config
  :custom
  (aidermacs-use-architect-mode t)
  (aidermacs-default-model "gemini/gemini-2.5-flash-preview-04-17"))

(setq aidermacs-program (expand-file-name "~/.local/bin/aider"))
