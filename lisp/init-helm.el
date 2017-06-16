(require-package 'helm)
(require 'helm-config)
(helm-mode 1)

(setq helm-autoresize-min-height 15)
(setq helm-autoresize-max-height 30)
(helm-autoresize-mode t)

(setq helm-buffer-max-length 40)

(setq helm-ff-tramp-not-fancy nil)

(require-package 'helm-flx)
(helm-flx-mode t)

(require-package 'helm-fuzzier)
(helm-fuzzier-mode t)

(require-package 'helm-ag)
(setq helm-ag-fuzzy-match t)

(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)

; Use same buffer for split
(setq helm-split-window-in-side-p t)

(require-package 'helm-swoop)
(setq helm-swoop-pre-input-function #'ignore)
(setq helm-swoop-use-fuzzy-match t)
(setq helm-swoop-use-line-number-face t)
(setq helm-swoop-speed-or-color t)

(require-package 'helm-projectile)

(setq projectile-cache-file (concat dotemacs-cache-directory "projectile.cache"))
(setq projectile-known-projects-file (concat dotemacs-cache-directory "projectile-bookmarks.eld"))

(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-use-git-grep 1)
(setq projectile-enable-caching t)
(setq projectile-file-exists-remote-cache nil)
(projectile-mode)

(provide 'init-helm)
