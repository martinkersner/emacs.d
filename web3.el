(use-package solidity-mode
  :ensure t)

(use-package flymake-solidity
  :ensure t)
(add-hook 'solidity-mode-hook 'flymake-solidity-load)
(setq flymake-solidity-executable "/opt/homebrew/bin/solcjs")

(use-package graphql-mode
  :ensure t)
