(require-package 'exec-path-from-shell)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

(require 'recentf)
(setq recentf-save-file (concat dotemacs-cache-directory "recentf"))
(setq recentf-max-menu-items 500)
(setq recentf-max-saved-items 1000)
(setq recentf-auto-cleanup 300)
(recentf-mode 1)

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

(require 'desktop)
(setq desktop-dirname dotemacs-cache-directory)
(add-to-list 'desktop-path dotemacs-cache-directory)

(desktop-save-mode 1)

(if (display-graphic-p)
    (progn
      (require-package 'git-gutter-fringe+)
      (require 'git-gutter-fringe+)
      (require-package 'git-gutter+)
      (global-git-gutter+-mode)
      (fringe-mode 16))
  )

(require-package 'color-identifiers-mode)
(global-color-identifiers-mode)

; Save window configs (C-c <left>)
(winner-mode)

(require-package 'yaml-mode)
(require-package 'dumb-jump)
(setq dumb-jump-selector 'helm)

(provide 'init-util)
