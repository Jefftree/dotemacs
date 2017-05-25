(require-package 'jbeans-theme)
(load-theme 'jbeans t)


; Display/Color Scheme Modifications
(blink-cursor-mode 0) ; no blink

(global-hl-line-mode)

(require-package 'nlinum)
(global-nlinum-mode t)

(set-face-background 'hl-line "darkblue")
(set-face-foreground 'linum "grey42")

(require-package 'spaceline)
(require 'spaceline-config)

(spaceline-helm-mode)
(setq spaceline-highlight-face-func #'spaceline-highlight-face-evil-state) ; Different highlighting for modes
(setq powerline-default-separator 'wave)

(spaceline-toggle-minor-modes-off) ; Saves diminish
(spaceline-toggle-hud-off) ; Bar at very right

(set-face-attribute 'spaceline-evil-emacs nil :background "#5fd7ff")
(set-face-attribute 'spaceline-evil-insert nil :background "#f0d817")
(set-face-attribute 'spaceline-evil-motion nil :background "#ae81ff")
(set-face-attribute 'spaceline-evil-normal nil :background "#a6e22e")
(set-face-attribute 'spaceline-evil-replace nil :background "#f92672")
(set-face-attribute 'spaceline-evil-visual nil :background "#fd971f")

(spaceline-spacemacs-theme)

(provide 'init-theme)
