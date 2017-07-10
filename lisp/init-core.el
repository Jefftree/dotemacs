;; Housekeeping
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(setq-default indent-tabs-mode nil)
(setq tab-width 4)

(when (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(unless (display-graphic-p) (menu-bar-mode -1))

(fset 'yes-or-no-p 'y-or-n-p)

;; 3 Lines for vim's scrolloff
(setq scroll-margin 10)
(setq scroll-preserve-screen-position t)
(setq scroll-conservatively 9999)

;; Disable bell
(setq ring-bell-function 'ignore)

;; Matching parenthesis
(show-paren-mode 1)
(setq show-paren-delay 0)

(setq mouse-wheel-progressive-speed nil)

;; multiple-backups
;; WIP
(setq backup-directory-alist `((".*" . ,(expand-file-name (concat dotemacs-cache-directory "backups/")))))
(setq backup-by-copying t)
(setq version-control t)
(setq kept-old-versions 0)
(setq kept-new-versions 20)
(setq delete-old-versions t)

;; move auto-save to the cache
;; WIP
(let ((dir (expand-file-name (concat dotemacs-cache-directory "auto-save/"))))
  (setq auto-save-list-file-prefix (concat dir "saves-"))
  (setq auto-save-file-name-transforms `((".*" ,(concat dir "save-") t))))

;; Disable tab indentation
(setq-default indent-tabs-mode nil)

;; Sentences end with single space
(setq sentence-end-double-space nil)

;; Remove trailing whitespace before save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init-core)
