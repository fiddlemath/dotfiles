(provide 'fiddle-lib)

(defun delete-this-frame ()
  "Close the current frame, whether there are several open frames or just one."
  (interactive)
  (if (< 1 (length (frame-list)))
       (delete-frame)
       (save-buffers-kill-terminal) ))

(defun handle-text ()
  "Enable appropriate, general settings for writing text."
  (interactive)
  (visual-line-mode t)
  (adaptive-wrap-prefix-mode t)
)

(defun journal ()
  "Open a new journal entry, and set it for editing in a nice environment."
  (interactive)
  (find-file "~/brain/journal.org")
  ;;(setq writeroom-width 60)
  ;;(writeroom-mode)
  ;;(text-scale-increase)
  (org-global-cycle 2)

  (end-of-buffer)
  (org-insert-heading)
  (org-insert-time-stamp nil t t)
  (newline)
  (org-narrow-to-subtree)
  (flyspell-mode 0)
  ;;(insert-file "~/.emacs.d/templates/journal-entry.org")
)

;;
;; Window management and navigation
;;

(defun p-window ()
  "Switch to previous window"
  (interactive)
  (other-window (- 1) )
)

(defun size-window (&optional width)
  "Neatly set the width of this window."
  (interactive "p")
  (let ((w (if (< width 4) 100 width)))
    (enlarge-window-horizontally (- w (window-width)))))

(defun set-window-height (height)
  "Neatly set the height of this window."
  (interactive "nWindow height: ")
  (enlarge-window (- (+ height 1) (window-height))))

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

(defun flash-mode-line-green ()
  "Flash the modeline green. Intended to replace ringing the bell."
  ;;(interactive)
  (let ((orig-fg (face-foreground 'mode-line)))
    (set-face-foreground 'mode-line "#97D123")
    (run-with-timer 0.08 nil
                    (lambda (fg) (set-face-foreground 'mode-line fg))
                    orig-fg))
  )

(defun dired-dotfiles-toggle ()
  "Show/hide dot-files"
  (interactive)
  (when (equal major-mode 'dired-mode)
    (if (or (not (boundp 'dired-dotfiles-show-p)) dired-dotfiles-show-p) ; if currently showing
	(progn
	  (set (make-local-variable 'dired-dotfiles-show-p) nil)
	  (message "h")
	  (dired-mark-files-regexp "^\\\.")
	  (dired-do-kill-lines))
      (progn (revert-buffer) ; otherwise just revert to re-show
	     (set (make-local-variable 'dired-dotfiles-show-p) t)))))

(defun add-to-path (dir)
  "Add dir both to PATH and exec-path"
  (setenv "PATH" (concat (getenv "PATH") ":" dir))
  (add-to-list 'exec-path dir))
