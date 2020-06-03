(provide 'factor/rust)

;; Matt's Rust factor

;; (use-package flycheck
;;     :hook (prog-mode . flycheck-mode))

;; (use-package company
;;     :hook (prog-mode . company-mode)
;;     :config (setq company-tooltip-align-annotations t)
;;     (setq company-minimum-prefix-length 1))

;; TODO: set up nice keybindings.
;; TODO: set up autocomplete (with company?)
;; TODO: set up flycheck.
;; TODO: tidy all these comments!
;; See also: https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/

(use-package lsp-mode
  ;; :hook (rust-mode . lsp)
  :commands lsp-deferred
  :custom (lsp-enable-snippet nil "Disable snippets, at least until I set up yasnippet")
  :init
  (setq lsp-ui-sideline-enable nil)
)
;; (use-package lsp-ui)
(use-package toml-mode)
(use-package rust-mode
    :mode "\\.rs\\'"
    :hook (rust-mode . lsp-deferred)
    :bind (:map rust-mode-map
                ("M-." . lsp-find-definition)
                ("M-," . pop-tag-mark))
                ;; ("C-c C-n" . flymake-goto-next-error)
                ;; ("C-c C-p" . flymake-goto-prev-error)
                ;; ("C-c C-e" . flymake-display-err-menu-for-current-line)
    :config
    (defun config-rust-buffer ()
      (add-to-path "/Users/fiddle/.cargo/bin")
      (flymake-mode nil)
      (handle-code) )
    (add-hook 'rust-mode-hook 'config-rust-buffer) )

(use-package cargo
  :hook (rust-mode . cargo-minor-mode)
  :config
  (add-hook 'rust-mode-hook 'handle-code))

(add-hook 'cargo-process-mode-hook 'visual-line-mode)

;(use-package flycheck-rust
;    :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
