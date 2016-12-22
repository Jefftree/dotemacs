(require-package 'helm)
(helm-mode 1)

(setq helm-buffer-max-length 40)

(require-package 'helm-flx)
(helm-flx-mode t)

(require-package 'helm-fuzzier)
(helm-fuzzier-mode t)

(require-package 'helm-ag)
(setq helm-ag-fuzzy-match t)

(require-package 'helm-projectile)

(define-key evil-normal-state-map (kbd "-") 'helm-find-files)
(define-key evil-normal-state-map (kbd "C-p") 'helm-projectile)

(provide 'init-helm)
