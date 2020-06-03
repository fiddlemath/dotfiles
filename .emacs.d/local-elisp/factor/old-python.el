;;(provide 'factor/python)

(use-package python-mode :ensure nil
  :mode "\\.py\\'"
  :interpreter "python3"

  :config
  (pyenv-mode)
  (pyenv-mode-set "3.8.2")
  (setq python-shell-interpreter "ipython3"
        python-shell-interpreter-args "-i" )

  (defun config-python-buffer ()
    (set (make-variable-buffer-local 'beginning-of-defun-function) 'py-beginning-of-def-or-class)
    (setq outline-regexp "def\\|class ")
    (handle-code))
  (add-hook 'python-mode-hook 'config-python-buffer))
