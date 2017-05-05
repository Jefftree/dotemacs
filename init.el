;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-hook 'emacs-startup-hook 'toggle-frame-maximized)

;; Housekeeping
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(show-paren-mode 1) ; Matching parenthesis

(setq js-indent-level 2) ; Javscript indentation: 2

;; Load all lisp files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; Prevent blob at bottom of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(defmacro after (feature &rest body))

(require 'init-elpa)
(require 'init-evil)
(require 'init-helm)
(require 'init-company)
(require 'init-theme)

(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require-package 'markdown-mode)
(setq markdown-command "multimarkdown")
(setq markdown-enable-math 1)

(require-package 'flycheck)
(global-flycheck-mode)

(setq backup-directory-alist `(("." . "~/.emacs.d/saves")))
(setq backup-by-copying t)

(require-package 'which-key)
(which-key-mode)

(setq scroll-margin 15)

(if (display-graphic-p)
    (progn
      (require-package 'git-gutter-fringe+)
      (require 'git-gutter-fringe+))
  (require-package 'git-gutter+))

(global-git-gutter+-mode)

(setq default-directory "~/" )
