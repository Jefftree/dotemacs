(require-package 'company)
(require-package 'company-jedi)

(require 'company)
(add-to-list 'company-backends 'company-jedi)


(setq company-idle-delay 0)

(setq company-show-numbers t)
(setq company-minimum-prefix-length 1)
(provide 'init-company)

(setq company-tooltip-limit 20)

(set-face-attribute 'company-tooltip nil :background "black" :foreground "gray40")
(set-face-attribute 'company-tooltip-selection nil :inherit 'company-tooltip :background "gray15")

(global-company-mode)
