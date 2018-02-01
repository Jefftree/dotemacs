(require-package 'company)
(require-package 'company-jedi)

(require 'company)

(defun my/python-mode-hook ()
  (add-to-list 'company-backends 'company-jedi))

(add-hook 'python-mode-hook 'my/python-mode-hook)

(setq company-idle-delay 0)

(setq company-show-numbers t)
(setq company-minimum-prefix-length 1)

(setq company-tooltip-limit 20)

(setq company-global-modes
        '(not eshell-mode org-mode))

(add-hook 'after-init-hook #'global-company-mode)

(provide 'init-company)
