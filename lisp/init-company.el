(require-package 'company)
(require-package 'company-jedi)

(require 'company)
(add-to-list 'company-backends 'company-jedi)


(setq company-idle-delay 0)

(setq company-show-numbers t)
(setq company-minimum-prefix-length 1)
(provide 'init-company)

(setq company-tooltip-limit 20)

(setq company-global-modes
        '(not eshell-mode org-mode))

(global-company-mode)
