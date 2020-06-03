(add-to-list 'load-path "~/.emacs.d/local-elisp")

(require 'fiddle-pkg-setup) ;; Set up package management and use-package
(require 'fiddle-lib)       ;; Define some global utility functions

;;;;;;;;;;;;;;;;;;;;;
;; Global settings ;;
;;;;;;;;;;;;;;;;;;;;;

(add-to-path "/usr/local/bin")

;; visual style
(use-package monokai-theme :config (load-theme 'monokai t))
(add-to-list 'default-frame-alist '(font . "Source Code Pro-11"))
(global-font-lock-mode t)            ; Generally enable syntax highlighting.
;; (scroll-bar-mode 0)

(use-package smart-shift :ensure nil :config (global-smart-shift-mode 1))
(use-package paren :ensure nil :config (show-paren-mode t))

;; miscellaneous...
(setq-default
 inhibit-startup-message t                       ; Inhibit splash screen.
 browse-url-browser-function 'browse-url-generic ; Use the generic url handler ...
 browse-url-generic-program "open"               ; ... set to the OS url handler.
 default-tab-width 4                             ; Default tab width 4
 split-height-threshold nil                      ; Auto-split windows horizontally...
 split-width-threshold 180                       ; ... when 180 chars or wider.
 ispell-program-name "/usr/local/bin/ispell"
 ring-bell-function 'flash-mode-line-green       ; Blink mode line instead of beeping.
 default-directory "~/"                          ; Default directory.
 speedbar-use-images nil                         ; Don't use the ugly speedbar defaults
 )

;; autosave locations
(setq-default
 backup-directory-alist '(("." . "~/.emacs-saves/"))    ; don't litter my fs tree
 backup-by-copying t      ; don't clobber symlinks
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t        ; use versioned backups
 )

;; save customize settings elsewhere
(setq custom-file "~/.emacs.d/customize-settings.el")
(load custom-file)

;; global keybindings
(bind-keys
 ("C-c g" . goto-line)
 ("C-c r" . revert-buffer)
 ("C-<tab>" . indent-relative)
 ("A-<spc>" . fixup-whitespace)    ; Leave at most one space around point.
 ("C-c >" . increase-left-margin)
 ("C-c <" . decrease-left-margin)
 ;; from fiddle-lib...
 ("C-x C-c" . delete-this-frame)
 ("C-x M-o" . p-window)
 ("C-c w" . size-window)
 ("C-c h" . set-window-height)
 )
;; (global-set-key (kbd "<f12>") 'toggle-window-dedicated)

;; Don't ask "yes or no"; ask "y or n":
(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'text-mode 'handle-text)
;; Use indent guides whenever you open a file
(add-hook 'find-file-hook 'highlight-indent-guides-mode)
;; Delete trailing whitespace when you save things:
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; Have comint shells look OK with color output
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

(use-package dired-x
  :ensure nil
  :config
  (defun dired-hide-details-by-default () (dired-hide-details-mode 1))
  (setq-default
   dired-omit-files-p t
   dired-omit-files (concat dired-omit-files "\\|^\\..+$") )
  (add-hook 'dired-mode-hook 'dired-hide-details-by-default) )

;; Select configuration factors -- see .emacs.d/local-elisp/factors for other av
;; For basic notes on use-package, see brain/tech/emacs.md

;; (Require 'factor/org)
(require 'factor/markdown)
(require 'factor/python)
(require 'factor/typescript)
(require 'factor/speedbar)
;; (require 'factor/go)

;; TODO: make a good factor for origami-mode
