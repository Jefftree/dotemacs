(require-package 'flycheck)

(setq flycheck-disabled-checkers '(emacs-lisp-checkdoc))
(add-hook 'after-init-hook #'global-flycheck-mode)

(provide 'init-flycheck)
