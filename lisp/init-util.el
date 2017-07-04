(require-package 'exec-path-from-shell)
(setq exec-path-from-shell-check-startup-files nil)
(when (memq window-system '(mac ns x))
  (exec-path-from-shell-initialize))

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

(require 'desktop)
(setq desktop-dirname dotemacs-cache-directory)
(add-to-list 'desktop-path dotemacs-cache-directory)

(desktop-save-mode 1)

(if (display-graphic-p)
    (progn
      (require-package 'git-gutter-fringe)
      (require 'git-gutter-fringe)
      (global-git-gutter-mode)
    )
)

  ;; places the git gutter outside the margins.
  ;; Reference: https://github.com/hlissner/.emacs.d
(after 'git-gutter-fringe
      (setq-default fringes-outside-margins t)
      (defvar line-bitmap [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224])
      (defvar deleted-bitmap [0 0 0 0 0 0 0 0 0 0 0 0 0 128 192 224 240 248])
      (define-fringe-bitmap 'git-gutter-fr:added line-bitmap nil 2 'center)
      (define-fringe-bitmap 'git-gutter-fr:modified line-bitmap nil 2 'center)
      (define-fringe-bitmap 'git-gutter-fr:deleted deleted-bitmap nil 2 'center))
(require-package 'color-identifiers-mode)
(add-hook 'after-init-hook #'global-color-identifiers-mode)

; Save window configs (C-c <left>)
(add-hook 'after-init-hook #'winner-mode)

(require-package 'yaml-mode)
(require-package 'dumb-jump)
(setq dumb-jump-selector 'helm)

(require-package 'avy)

(provide 'init-util)
