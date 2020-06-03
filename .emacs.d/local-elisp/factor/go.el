(provide 'factor/go)

(use-package go-mode
;; For further go-mode customization, check out:
;; http://tleyden.github.io/blog/2014/05/22/configure-emacs-as-a-go-editor-from-scratch/
;; http://tleyden.github.io/blog/2014/05/27/configure-emacs-as-a-go-editor-from-scratch-part-2/
;; In particular, the Go Oracle (described in part 2) might be amazing.
  :mode "\\.go\\'"
  :interpreter "go"

  :bind (:map go-mode-map
              ("M-." . godef-jump)
              ("M-," . pop-tag-mark)
              ("C-c C-n" . flymake-goto-next-error)
              ("C-c C-p" . flymake-goto-prev-error)
              ("C-c C-e" . flymake-display-err-menu-for-current-line)
              ("C-c C-t" . go-test-current-project))

  :load-path "~/go/src/github.com/dougm/goflymake"

  :config
  (setq-default gofmt-command "goimports")
  ;; (use-package go-flymake)
  ;; (use-package auto-complete-config :config (ac-config-default))
  ;; (use-package go-autocomplete)
  (use-package go-guru)

  ;; So many things for the Go hook, because all should be local to Go buffers.
  (defun config-go-buffer ()
     (setq tab-width 4
           standard-indent 4
           indent-tabs-mode nil
           show-trailing-whitespace nil)
     (add-hook 'before-save-hook 'gofmt-before-save)
     (setenv "GOPATH" "/home/fiddle/go/")
     (add-to-path "/Users/fiddle/go/bin")
     (add-to-path "/usr/local/go/bin/")
     (handle-code))
  (add-hook 'go-mode-hook 'config-go-buffer))
