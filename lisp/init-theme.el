(require-package 'jbeans-theme)
(load-theme 'jbeans t)


; Display/Color Scheme Modifications
(blink-cursor-mode 0) ; no blink

(global-hl-line-mode)

(require-package 'nlinum)
(global-nlinum-mode t)

(set-face-background 'hl-line "darkblue")
(set-face-foreground 'linum "grey98")

(require-package 'spaceline)
(require 'spaceline-config)
(setq spaceline-highlight-face-func #'spaceline-highlight-face-evil-state) ; Different highlighting for modes
(spaceline-spacemacs-theme)
(spaceline-helm-mode)

(provide 'init-theme)
