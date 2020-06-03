(provide 'factor/speedbar)

;; sr-speedbar factor: customizations for the in-frame speedbar.
;; See: https://www.emacswiki.org/emacs/SrSpeedbar
(require 'sr-speedbar) ;; Put speedbar in the current frame

(defun fiddle-speedbar-toggle ()
  (interactive)
  (sr-speedbar-toggle)
  (if (sr-speedbar-exist-p)
      (with-current-buffer sr-speedbar-buffer-name
        (setq window-size-fixed 'width))))

(bind-key "C-c s" 'fiddle-speedbar-toggle)
