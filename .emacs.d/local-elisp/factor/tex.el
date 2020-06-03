(provide 'factor/tex)

;; Auctex has a wonky package layout, because it's about five hundred packages.
(use-package tex-site
    :ensure auctex
    :mode ("\\.tex\\'" . latex-mode)

    :config
    (setq TeX-command-default "LaTeX"
          TeX-save-query nil
          TeX-show-compilation t)
    (add-hook 'BibTeX-mode-hook 'handle-text)

    (defun config-latex-buffer ()
      (add-to-list 'TeX-command-list
                   '("XeLaTeX" "xelatex -halt-on-error -shell-escape %t" TeX-run-TeX nil t))
      (handle-text))
    (add-hook 'LaTeX-mode-hook 'config-latex-buffer))
