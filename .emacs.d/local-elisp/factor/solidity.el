(provide 'factor/solidity)

(use-package solidity-mode
  :config
  (defun config-solidity-buffer ()
    (column-enforce-n 99))
  (add-hook 'solidity-mode-hook 'config-solidity-buffer))
