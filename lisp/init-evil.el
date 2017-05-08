(require-package 'evil)
(require 'evil)
(evil-mode)

(require-package 'magit)
(define-key evil-normal-state-map (kbd "C-c gs") 'magit-status)

(setq evil-emacs-state-cursor '("cyan" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("magenta" box))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(require-package 'evil-surround)
(global-evil-surround-mode)

(provide 'init-evil)
