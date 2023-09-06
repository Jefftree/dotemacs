(require-package 'evil)
(require 'evil)
(evil-mode)

(require-package 'magit)

(after 'magit
  (add-hook 'git-commit-mode-hook 'evil-insert-state) ; Start commits in insert state
)

(add-hook 'org-capture-mode-hook 'evil-insert-state) ; Org capture start in insert state


(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

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

(add-hook 'after-init-hook
  (lambda ()
    (evil-put-property 'evil-state-properties 'normal :tag " NORMAL ")
    (evil-put-property 'evil-state-properties 'insert :tag " INSERT ")
    (evil-put-property 'evil-state-properties 'visual :tag " VISUAL ")
    (evil-put-property 'evil-state-properties 'motion :tag " MOTION ")
    (evil-put-property 'evil-state-properties 'emacs :tag " EMACS ")
    (evil-put-property 'evil-state-properties 'replace :tag " REPLACE ")
    (evil-put-property 'evil-state-properties 'operator :tag " OPERATOR ")
))

(evil-set-initial-state 'eshell-mode 'emacs)
(evil-set-initial-state 'inferior-python-mode 'emacs)
(evil-set-initial-state 'magit-blame-mode 'emacs)
(evil-set-initial-state 'flycheck-error-list-mode 'emacs)


(provide 'init-evil)
