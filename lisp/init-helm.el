(require-package 'helm)
(require 'helm-config)
(helm-mode 1)

(helm-autoresize-mode t)
(setq helm-autoresize-min-height 20)

(setq helm-buffer-max-length 40)

(require-package 'helm-flx)
(helm-flx-mode t)

(require-package 'helm-fuzzier)
(helm-fuzzier-mode t)

(require-package 'helm-ag)
(setq helm-ag-fuzzy-match t)

(setq helm-M-x-fuzzy-match t)

(require-package 'helm-projectile)
(setq projectile-completion-system 'helm)
(helm-projectile-on)

(setq projectile-use-git-grep 1)
(setq projectile-enable-caching t)
(setq projectile-file-exists-remote-cache nil)
(projectile-mode)

(define-key evil-normal-state-map (kbd "-") 'helm-find-files)

(define-key evil-normal-state-map (kbd "SPC SPC") 'helm-M-x)
(define-key evil-normal-state-map (kbd "SPC f") 'helm-find-files)
(define-key evil-normal-state-map (kbd "SPC p f") 'helm-projectile-find-file)
(define-key evil-normal-state-map (kbd "SPC b") 'helm-buffers-list)
(define-key evil-normal-state-map (kbd "SPC y") 'helm-show-kill-ring)
(define-key evil-normal-state-map (kbd "SPC e") 'eval-buffer)
(define-key evil-normal-state-map (kbd "SPC p p") 'helm-projectile-switch-project)
(define-key evil-normal-state-map (kbd "SPC r") 'helm-recentf)

(provide 'init-helm)
