(provide 'factor/typescript)

(use-package tide
  :ensure t
  :after (typescript-mode company flycheck) ; list dependencies
  :hook ((typescript-mode . tide-setup)
         (typescript-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))
