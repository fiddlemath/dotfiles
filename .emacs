;; .emacs

;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; Find local site-lisp packages.
(setq exec-path (append (list "/usr/local/bin/" "/opt/local/bin/") exec-path))

;;-------------;;
;; Custom keys ;;
;;-------------;;

;; Goto line number (input).
(global-set-key "\C-cg" 'goto-line)
;; Toggle comment on region.
(global-set-key "\C-c#" 'comment-or-uncomment-region)
;; Indent to reasonable location, consideringthe spaces in the previous line.
(global-set-key (kbd "C-<tab>") 'indent-relative) 
(global-set-key (kbd "A-<spc>") 'fixup-whitespace)

(global-set-key "\C-c>" 'increase-left-margin)
(global-set-key "\C-c<" 'decrease-left-margin)

;; Run make 
(global-set-key "\C-cm" 'compile)
;; I use this for reading debugging information all the time.
(global-set-key "\C-cr" 'revert-buffer)

(defun handle-text ()
  "Enable appropriate modes for writing text."
  (interactive)
  (visual-line-mode t)
  (flyspell-mode t)
)

(defun p-window ()
  (interactive)
  (other-window (- 1) )
)
(global-set-key "\C-x\M-o" 'p-window)

;; window resizing
(defun size-window (&optional width)
  (interactive "p")
  (let ((w (if (< width 4) 80 width)))
    (enlarge-window-horizontally (- w (window-width)))))
(global-set-key "\C-cw" 'size-window)

(defun set-window-height (height)
  (interactive "nWindow height: ")
  (enlarge-window (- (+ height 1) (window-height))))
(global-set-key "\C-ch" 'set-window-height)

;; Toggle window dedication
(defun toggle-window-dedicated ()
  "Toggle whether the current active window is dedicated or not"
  (interactive)
  (message 
     (if (let (window (get-buffer-window (current-buffer)))
           (set-window-dedicated-p window 
                                   (not (window-dedicated-p window))))
         "Window '%s' is now dedicated"
       "Window '%s' is now free-floating")
     (current-buffer)))
(global-set-key (kbd "<f12>") 'toggle-window-dedicated)

;; Copy current filename to kill ring.
(defun save-visited-filename-to-kill-ring ()
  "Save the current buffer's file name to the kill ring."
  (interactive)
  (kill-new (concat "\"" (buffer-file-name) "\""))
)
(global-set-key "\C-x\M-f" 'save-visited-filename-to-kill-ring)

(defun kill-buffer-regexp (pattern)
  "Kill the buffers whose name matches PATTERN.

PATTERN may be a plain string or a regular expression."
  (interactive "MPattern: ")
  (let (kill-list)
    (dolist (buf (buffer-list))
      (when (string-match pattern (buffer-name buf))
        (setq kill-list (cons buf kill-list))))
    (when kill-list
      (dolist (buf kill-list)
        (kill-buffer buf)))))

;;---------------------;;
;; Other global tweaks ;;
;;---------------------;;

;; Inhibit splash screen.
(setq inhibit-startup-message t)

;; Don't ask "yes or no"; ask "y or n".
(fset 'yes-or-no-p 'y-or-n-p)

;; Highlight matching parentheses
(require 'paren) (show-paren-mode t)

;; Enable syntax highlighting.
(global-font-lock-mode t)

;; Change backup filenames
(defun make-backup-file-name (file)
  (concat
    (file-name-directory file) "." (file-name-nondirectory file) "~" ))

;; Colors in interactive shells.
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Use my browser.
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "open")
(global-set-key "\C-xw" 'browse-url)

;; Disable menu bar.
(menu-bar-mode -1)

;; Narrow fringes to display wrapped lines.
;; (fringe-mode '(0 . 2))
(setq ispell-program-name "/usr/local/bin/ispell")

;; enable visual feedback on selections
;;(setq transient-mark-mode t)

;;--------------------;;
;; Enable major modes ;;
;;--------------------;;

;; Lilypond
(autoload 'LilyPond-mode "lilypond-mode" "LilyPond Editing Mode" t)
(add-to-list 'auto-mode-alist '("\\.ly$" . LilyPond-mode))
(add-to-list 'auto-mode-alist '("\\.ily$" . LilyPond-mode))
(add-hook 'LilyPond-mode-hook (lambda () (turn-on-font-lock)))

;; AucTeX
;; (load "auctex.el" nil t t)
;; (load "preview-latex.el" nil t t)
;; ;; spell-checking when editing TeX files.
;; (add-hook 'LaTeX-mode-hook 'flyspell-mode)
;; ;; Better line wrap when editing TeX files.
;; (add-hook 'LaTeX-mode-hook 'visual-line-mode)
;; ;;(setq-default TeX-master dwim)
;;  ;;set xetex mode in tex/latex
;; (add-hook 'LaTeX-mode-hook (lambda()
;;   (add-to-list 'TeX-command-list
;;                '("XeLaTeX" "xelatex -halt-on-error -shell-escape %t" TeX-run-TeX nil t))
;;   (setq TeX-command-default "LaTeX")
;;   (setq TeX-save-query nil)
;;   (setq TeX-show-compilation t)))

;; (add-hook 'BibTeX-mode-hook 'visual-line-mode)

;; Markdown mode
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdwon files." t)
(setq markdown-enable-itex t)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

(defun underline (c)
  (save-excursion
    (let (w)
      (move-end-of-line 1)
      (setq w (current-column))
      (newline)
      (insert (apply 'concat (make-list w c)))
    )))

(defun markdown-under-title ()
  (interactive)
  (underline "=")
)

(defun markdown-under-section ()
  (interactive)
  (underline "-")
)

(add-hook 'markdown-mode-hook
  (lambda () 
    (local-set-key "\C-c\C-tt" 'markdown-under-title)
    (local-set-key "\C-c\C-ts" 'markdown-under-section)
    ))

;; org mode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-time-stamp-custom-formats '("<%d %b, %a>" . "<%d %b, %a %H:%M>"))
(add-hook 'org-mode-hook 'handle-text)

;; Assume that everything in ~/brain/ is Markdown.
(add-hook 'markdown-mode-hook 'flyspell-mode)
(add-hook 'markdown-mode-hook 'visual-line-mode)

;; Python mode
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(add-hook 'python-mode-hook
          (lambda ()
            (set (make-variable-buffer-local 'beginning-of-defun-function)
                 'py-beginning-of-def-or-class)
            (setq outline-regexp "def\\|class ")))

;; Tuareg (Good OCaml) mode
;; (add-to-list 'auto-mode-alist '("\\.ml[iylp]?" . tuareg-mode))
;; (autoload 'tuareg-mode "tuareg" "Major mode for editing Caml code" t)
;; (autoload 'camldebug "camldebug" "Run the Caml debugger" t)

;; SML mode
;; (load "sml-mode/sml-mode-startup.el" nil t t)

;; Haskell mode
;; (load "haskell-mode-2.8.0/haskell-site-file")
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;;   ;; alternately: s/indentation/indent or s/indentation/simple-indent

;; (add-to-list 'default-frame-alist '(height . 67))
;; (add-to-list 'default-frame-alist '(background-mode . light))
(add-to-list 'default-frame-alist '(font . "Monaco-12"))
(add-to-list 'default-frame-alist '(cursor-color . "gray10"))
;; (add-to-list 'default-frame-alist '(foreground-color . "black"))
;; (add-to-list 'default-frame-alist '(background-color . "gray95"))

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
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^a5\\(?:comb\\|paper\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^a5\\(?:comb\\|paper\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "." "evince %o") ("^html?$" "." "netscape %o"))))
 '(TeX-quote-after-quote nil)
 '(c-basic-offset 4)
 '(c-cleanup-list (quote (scope-operator)))
 '(c-default-style "k&r")
 '(c-indent-comments-syntactically-p t)
 '(c-mode-hook nil)
 '(calendar-week-start-day 0 t)
 '(comment-start nil t)
 '(comment-start-skip nil t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(initial-scratch-message "")
 '(inverse-video t)
 '(markdown-enable-math t)
 '(mouse-wheel-mode t nil (mwheel))
 '(preview-scale-function 1.2)
 '(scalable-fonts-allowed t)
 '(standard-indent 4)
 '(tab-stop-list (quote (4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100 104 108 112 116 120)))
 '(tex-close-quote "\"")
 '(tex-dvi-view-command "xdvi")
 '(tex-open-quote "\"")
 '(tex-start-options-string "\\nonstopmode\\input" t)
 '(tool-bar-mode nil nil (tool-bar)))
 
(put 'downcase-region 'disabled nil)
