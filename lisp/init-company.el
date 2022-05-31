(require-package 'company)
;; (require-package 'company-jedi)
; (require-package 'company-tern)
(require-package 'company-go)

(require 'company)

;; (defun company/python-mode-hook ()
  ;; (add-to-list 'company-backends 'company-jedi))

; (defun company/js-mode-hook ()
;   (add-to-list 'company-backends 'company-tern)
;   (tern-mode))

(defun company/go-mode-hook ()
  (add-to-list 'company-backends 'company-go))


;; (add-hook 'python-mode-hook #'company/python-mode-hook)
;; (add-hook 'js-mode-hook #'company/js-mode-hook)
(add-hook 'go-mode-hook #'company/go-mode-hook)

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
