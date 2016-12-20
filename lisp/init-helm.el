(require-package 'helm)
(helm-mode 1)

(setq helm-buffer-max-length 40)

(require-package 'helm-flx)
(helm-flx-mode t)

(require-package 'helm-fuzzier)
(helm-fuzzier-mode t)

(require-package 'helm-ag)
(setq helm-ag-fuzzy-match t)

(provide 'init-helm)
