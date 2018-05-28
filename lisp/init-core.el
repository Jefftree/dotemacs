;; Housekeeping
(setq inhibit-splash-screen t)
(setq inhibit-startup-message t)

(setq-default indent-tabs-mode nil)
(setq tab-width 4)
(setq-default tab-width 4)
(defun my-c++-indent-setup ()
  (setq c-basic-offset 4)
  (setq indent-tabs-mode nil))

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

;; Include PATH specified by shell
(require-package 'exec-path-from-shell)
(setq exec-path-from-shell-check-startup-files nil)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

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

(require 'recentf)
(setq recentf-save-file (concat dotemacs-cache-directory "recentf"))
(setq recentf-max-menu-items 500)
(setq recentf-max-saved-items 1000)
(setq recentf-auto-cleanup 300)
(add-hook 'after-init-hook #'recentf-mode)

(require 'tramp)
(setq tramp-default-method "rsync")
(setq tramp-completion-reread-directory-timeout nil)
(setq tramp-persistency-file-name (concat dotemacs-cache-directory "tramp"))

(defun add-ssh-agent-to-tramp ()
  (cl-pushnew '("-A")
              (cadr (assoc 'tramp-login-args
                           (assoc "ssh" tramp-methods)))
              :test #'equal))
(add-ssh-agent-to-tramp)

;; Mouse support
(xterm-mouse-mode 1)

;; Disable tab indentation
(setq-default indent-tabs-mode nil)

;; Save bookmarks as cache
(setq bookmark-default-file (concat dotemacs-cache-directory "bookmarks"))

;; Sentences end with single space
(setq sentence-end-double-space nil)

;; Auto refresh file on change (usually vc pull on file)
(global-auto-revert-mode t)


;; Remove trailing whitespace before save.
(add-hook 'before-save-hook 'delete-trailing-whitespace)

(provide 'init-core)
