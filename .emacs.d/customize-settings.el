(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-command "latex")
 '(TeX-PDF-mode t)
 '(TeX-close-quote "''")
 '(TeX-command "tex")
 '(TeX-open-quote "``")
 '(TeX-output-view-style
   (quote
    (("^dvi$"
      ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$")
      "%(o?)dvips -t landscape %d -o && gv %f")
     ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f")
     ("^dvi$"
      ("^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "^landscape$")
      "%(o?)xdvi %dS -paper a4r -s 0 %d")
     ("^dvi$" "^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "%(o?)xdvi %dS -paper a4 %d")
     ("^dvi$"
      ("^a5\\(?:comb\\|paper\\)$" "^landscape$")
      "%(o?)xdvi %dS -paper a5r -s 0 %d")
     ("^dvi$" "^a5\\(?:comb\\|paper\\)$" "%(o?)xdvi %dS -paper a5 %d")
     ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d")
     ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d")
     ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d")
     ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d")
     ("^dvi$" "." "%(o?)xdvi %dS %d")
     ("^pdf$" "." "evince %o")
     ("^html?$" "." "netscape %o"))))
 '(TeX-quote-after-quote nil)
 '(ansi-color-names-vector
   ["#272822" "#F92672" "#A6E22E" "#E6DB74" "#66D9EF" "#FD5FF0" "#A1EFE4" "#F8F8F2"])
 '(bmkp-last-as-first-bookmark-file "~/.emacs.d/bookmarks")
 '(c-basic-offset 4)
 '(c-cleanup-list (quote (scope-operator)))
 '(c-default-style "k&r")
 '(c-indent-comments-syntactically-p t)
 '(c-mode-hook nil)
 '(calendar-week-start-day 0)
 '(column-number-mode t)
 '(comment-start nil t)
 '(comment-start-skip nil t)
 '(compilation-message-face (quote default))
 '(custom-safe-themes
   (quote
    ("6bc387a588201caf31151205e4e468f382ecc0b888bac98b2b525006f7cb3307" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" "a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "3629b62a41f2e5f84006ff14a2247e679745896b5eaa1d5bcfbc904a3441b0cd" "0ad5a61e6ee6d2e7f884c0da7a6f437a4c84547514b509bdffd06757a8fc751f" default)))
 '(elpy-modules
   (quote
    (elpy-module-company elpy-module-eldoc elpy-module-folding elpy-module-pyvenv elpy-module-yasnippet elpy-module-sane-defaults)))
 '(fci-rule-color "#3C3D37")
 '(gofmt-show-errors nil)
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-indent-guides-auto-character-face-perc 5)
 '(highlight-indent-guides-auto-even-face-perc 25)
 '(highlight-indent-guides-auto-odd-face-perc 10)
 '(highlight-indent-guides-auto-stack-even-face-perc 25)
 '(highlight-indent-guides-auto-stack-odd-face-perc 10)
 '(highlight-indent-guides-character 9474)
 '(highlight-indent-guides-method (quote character))
 '(highlight-indent-guides-responsive nil)
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(inverse-video t)
 '(kotlin-tab-width 4)
 '(lsp-enable-snippet nil)
 '(magit-diff-use-overlays nil)
 '(markdown-enable-math t)
 '(mouse-wheel-mode t nil (mwheel))
 '(nrepl-message-colors
   (quote
    ("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3")))
 '(org-agenda-files
   (quote
    ("/Users/fiddle/brain/easy-things-to-do.org" "/Users/fiddle/brain/journal.org" "/Users/fiddle/brain/psych-journal.org" "/Users/fiddle/brain/theorizing-meta.org" "/Users/fiddle/brain/thoughts.org")))
 '(org-emphasis-alist
   (quote
    (("*" bold)
     ("/" italic)
     ("_" underline)
     ("=" org-verbatim verbatim)
     ("|" org-code verbatim)
     ("~" org-code verbatim))))
 '(org-hide-emphasis-markers nil)
 '(org-image-actual-width (quote (400)))
 '(org-src-fontify-natively t)
 '(package-selected-packages
   (quote
    (origami-mode elpy highlight-indent-mode highlight-indent highlight-indent-guides smart-shift pyenv-mode tidal tide column-enforce-mode rjsx-mode go-autocomplete auto-complete-config go-flymake use-package-ensure company flycheck-rust cargo lsp-ui lsp-mode use-package-chords use-package solidity-mode rust-auto-use rust-mode rust-playground protobuf-mode yaml-mode xterm-color toml-mode python-mode origami monokai-theme markdown-mode hydra haskell-mode go-tag go-stacktracer go-snippets go-playground-cli go-playground go-imports go-guru go-gen-test go-errcheck go-dlv go-complete flymake-solidity flymake-go expand-region edit-indirect dockerfile-mode benchmark-init auto-complete adaptive-wrap)))
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(preview-scale-function 1.2)
 '(safe-local-variable-values
   (quote
    ((org-level-color-stars-only)
     (org-level-color-stars-only . 2)
     (org-level-color-stars-only . t)
     (eval text-scale-increase 2))))
 '(scalable-fonts-allowed t)
 '(sr-speedbar-delete-windows t)
 '(sr-speedbar-right-side nil)
 '(standard-indent 4)
 '(tab-stop-list
   (quote
    (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(tex-close-quote "\"")
 '(tex-dvi-view-command "xdvi")
 '(tex-open-quote "\"")
 '(tex-start-options-string "\\nonstopmode\\input" t)
 '(tool-bar-mode nil nil (tool-bar))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#F92672")
     (40 . "#CF4F1F")
     (60 . "#C26C0F")
     (80 . "#E6DB74")
     (100 . "#AB8C00")
     (120 . "#A18F00")
     (140 . "#989200")
     (160 . "#8E9500")
     (180 . "#A6E22E")
     (200 . "#729A1E")
     (220 . "#609C3C")
     (240 . "#4E9D5B")
     (260 . "#3C9F79")
     (280 . "#A1EFE4")
     (300 . "#299BA6")
     (320 . "#2896B5")
     (340 . "#2790C3")
     (360 . "#66D9EF"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0")))
 '(yaml-indent-offset 4))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(bold ((t (:weight bold))))
 '(bold-italic ((t (:slant italic :weight bold))))
 '(fixed-pitch ((t (:family "Source Code Pro"))))
 '(fixed-pitch-serif ((t (:family "Source Code Pro"))))
 '(font-lock-warning-face ((t (:foreground "orange red" :underline (:color foreground-color :style wave) :slant normal :weight bold))))
 '(italic ((t (:slant oblique))))
 '(markdown-code-face ((t (:inherit fixed-pitch :background "gray12"))))
 '(org-code ((t (:inherit font-lock-constant-face :foreground "#AE81FF"))))
 '(org-level-1 ((t (:inherit default :foreground "#FD971F" :weight bold :height 1.618))))
 '(org-level-2 ((t (:inherit default :foreground "#A6E22E" :weight bold :height 1.272))))
 '(org-level-3 ((t (:inherit default :foreground "#66D9EF" :weight bold))))
 '(org-target ((t (:foreground "dark gray"))))
 '(org-verbatim ((t (:inherit fixed-pitch))))
 '(trailing-whitespace ((t (:background "gray15" :underline "gray70"))))
 '(variable-pitch ((t (:foreground "gray90" :weight light :height 1.2 :family "Avenir")))))
