;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

;; Load all lisp files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; Prevent blob at bottom of init.el
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

(setq dotemacs-cache-directory (concat user-emacs-directory ".cache/"))

(defmacro after (feature &rest body))

(require 'init-elpa)
(require 'init-core)
(require 'init-evil)
(require 'init-helm)
(require 'init-company)
(require 'init-theme)
(require 'init-flycheck)
(require 'init-util)
(require 'init-misc)
(require 'init-bindings)

(setq default-directory "~/" )
