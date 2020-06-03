(provide 'factor/markdown)

(use-package markdown-mode
  :mode "\\.md\\'"
  :config
  (setq markdown-enable-itex t
        markdown-fontify-code-blocks-natively t
        markdown-xhtml-header-content "<meta charset=\"utf-8\">
   <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
   <link rel=\"stylesheet\"href=\"file:///Users/fiddle/scripts/templates/github-markdown.css\">")
  (add-hook 'markdown-mode-hook 'handle-text) )
