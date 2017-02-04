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

;; Load all lisp files
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

; Prevent blob at bottom of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

(defmacro after (feature &rest body))

(require 'init-elpa)
(require 'init-evil)
(require 'init-helm)

(require-package 'jbeans-theme)
(load-theme 'jbeans t)


(require-package 'company)
(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-idle-delay 0)

(require-package 'magit)

(if (display-graphic-p)
    (progn
      (require-package 'git-gutter-fringe+)
      (require 'git-gutter-fringe+))
  (require-package 'git-gutter+))

(global-git-gutter+-mode)

(add-hook 'prog-mode-hook 'linum-mode)

(require-package 'spaceline)
(require 'spaceline-config)
(setq spaceline-highlight-face-func #'spaceline-highlight-face-evil-state) ; Different highlighting for modes
(spaceline-spacemacs-theme)

(setq default-directory "~/" )
