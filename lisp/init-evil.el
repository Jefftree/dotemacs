(defun config-evil-leader ()
  "Configure evil leader mode."
  (evil-leader/set-leader ",")
  (evil-leader/set-key
    "w" 'save-buffer
    "v" (kbd "C-w v C-w l")
    "s" (kbd "C-w s C-w l")))

(require-package 'evil)
(require 'evil)
(evil-mode)

;(define-key evil-normal-state-map (kbd "C-h") 'evil-window-left)
(define-key evil-normal-state-map (kbd "C-j") 'evil-window-down)
(define-key evil-normal-state-map (kbd "C-k") 'evil-window-up)
(define-key evil-normal-state-map (kbd "C-l") 'evil-window-right)

(require-package 'magit)

(require-package 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)

(define-key evil-normal-state-map (kbd "C-c gs") 'magit-status)

(setq evil-emacs-state-cursor '("cyan" box))
(setq evil-normal-state-cursor '("green" box))
(setq evil-visual-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("magenta" box))
(setq evil-replace-state-cursor '("red" bar))
(setq evil-operator-state-cursor '("red" hollow))

(require-package 'evil-surround)
(global-evil-surround-mode)

(require-package 'evil-leader)
(global-evil-leader-mode)
(config-evil-leader)

(provide 'init-evil)
