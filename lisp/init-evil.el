(require-package 'evil)
(require 'evil)
(evil-mode)

(require-package 'magit)

(after 'magit
  (require-package 'evil-magit)
  (require 'evil-magit)
  (add-hook 'git-commit-mode-hook 'evil-insert-state) ; Start commits in insert state
)

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

;; forward search information
;; Spaceline takes care of status line location so we can disable the anzu display
(require-package 'evil-anzu)
(require 'evil-anzu)
(setq anzu-cons-mode-line-p nil)

(evil-put-property 'evil-state-properties 'normal :tag " NORMAL ")
(evil-put-property 'evil-state-properties 'insert :tag " INSERT ")
(evil-put-property 'evil-state-properties 'visual :tag " VISUAL ")
(evil-put-property 'evil-state-properties 'motion :tag " MOTION ")
(evil-put-property 'evil-state-properties 'emacs :tag " EMACS ")
(evil-put-property 'evil-state-properties 'replace :tag " REPLACE ")
(evil-put-property 'evil-state-properties 'operator :tag " OPERATOR ")

(evil-set-initial-state 'eshell-mode 'emacs)
(provide 'init-evil)
