(require-package 'evil)
(require 'evil)
(evil-mode)

(require-package 'magit)
(require-package 'evil-magit)
(require 'evil-magit)
(define-key evil-normal-state-map (kbd "C-c gs") 'magit-status)

(setq evil-emacs-state-cursor '("cyan" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("magenta" box))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(require-package 'evil-surround)
(global-evil-surround-mode t)

(require-package 'evil-commentary)
(evil-commentary-mode t)

(evil-put-property 'evil-state-properties 'normal :tag " NORMAL ")
(evil-put-property 'evil-state-properties 'insert :tag " INSERT ")
(evil-put-property 'evil-state-properties 'visual :tag " VISUAL ")
(evil-put-property 'evil-state-properties 'motion :tag " MOTION ")
(evil-put-property 'evil-state-properties 'emacs :tag " EMACS ")
(evil-put-property 'evil-state-properties 'replace :tag " REPLACE ")
(evil-put-property 'evil-state-properties 'operator :tag " OPERATOR ")

(provide 'init-evil)
