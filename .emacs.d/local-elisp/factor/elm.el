(provide 'factor/elm)

(use-package elm-mode
  :mode "\\.elm\\'"

  :config
  (defun config-elm-buffer ()
     (setq elm-tags-on-save t)
     (show-trailing-whitespace nil)
     (elm-format-on-save-mode)
     (handle-code))
  (add-hook 'elm-mode-hook 'config-elm-buffer)
)
