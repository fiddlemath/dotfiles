(provide 'factor/org)

(use-package org :ensure nil
  :mode ("\\.org\\'" . org-mode)
  :config
  (setq org-time-stamp-custom-formats '("<%d %b, %a>" . "<%d %b, %a %H:%M>")
        org-agenda-files '("~/brain/")
        org-image-actual-width '(400))
  (add-hook 'org-mode-hook 'handle-text)
  :custom
  (org-src-fontify-natively t "Fontify source code blocks using that language's emacs mode")
  (org-image-actual-width (quote (400)) "When showing images in an org buffer, use a sensible default width")
  )
