(provide 'fiddle-pkg-setup)

;; Use the emacs package manager.
(require 'package)
(package-initialize)
(setq package-enable-at-startup nil)

;; Use add-on package archives.
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))

(unless package-archive-contents (package-refresh-contents))
(unless (package-installed-p 'use-package) (package-install 'use-package))

;; This is basically "require 'use-package", except it gets an extra expansion at compile-time
(eval-when-compile (require 'use-package))

;; By default, ensure a package is installed if use-package refers to it.
(require 'use-package-ensure)
(setq use-package-always-ensure t)
(require 'bind-key)
