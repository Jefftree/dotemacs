(require-package 'company)
(require 'company)

(require-package 'company-quickhelp)

(setq company-idle-delay 0)

(setq company-show-numbers t)
(setq company-minimum-prefix-length 1)

(setq company-tooltip-limit 20)

(setq company-global-modes
        '(not eshell-mode org-mode))

(add-hook 'after-init-hook #'global-company-mode)
(add-hook 'after-init-hook #'company-quickhelp-mode)

(provide 'init-company)
