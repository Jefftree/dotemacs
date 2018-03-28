(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'tree t)

(when (member "Ubuntu Mono" (font-family-list))
  (set-frame-font "Ubuntu Mono 14"))

; Display/Color Scheme Modifications
(blink-cursor-mode 0) ; no blink

(global-hl-line-mode)

(setq display-time-string-forms
  '((concat " " 12-hours ":" minutes " " (upcase am-pm))
))

(display-time-mode 1)
(require-package 'nlinum)

(require-package 'all-the-icons)

;; This is required for new machines
;; (all-the-icons-install-fonts)

;; (require-package 'nyan-mode)
;; (nyan-mode)

(set-face-background 'hl-line "darkblue")

(require-package 'rainbow-mode)
(require 'rainbow-mode)
(setq rainbow-x-colors 0) ;; Disable highlighting words like "red" "yellow"

(require-package 'spaceline)
(require 'spaceline-config)

(after 'helm-mode
  (spaceline-helm-mode)
  (set-face-attribute 'helm-selection nil :background "darkblue")
)

(setq spaceline-highlight-face-func #'spaceline-highlight-face-evil-state) ; Different highlighting for modes
(setq powerline-default-separator 'wave)
(setq ns-use-srgb-colorspace nil) ; Fix powerline inconsistent colors

; WIP, prefer vsplit over hsplit
(setq split-width-threshold 180)
(setq split-height-threshold nil)

(spaceline-toggle-minor-modes-off) ; Saves diminish
(spaceline-toggle-hud-off) ; Bar at very right
(spaceline-toggle-major-mode-off)
(spaceline-toggle-buffer-encoding-abbrev-off) ; line ending
(spaceline-toggle-version-control-off)
(spaceline-toggle-buffer-position-off) ; Top Bot

(set-face-attribute 'spaceline-evil-emacs nil :background "#5fd7ff")
(set-face-attribute 'spaceline-evil-insert nil :background "#f0d817")
(set-face-attribute 'spaceline-evil-motion nil :background "#ae81ff")
(set-face-attribute 'spaceline-evil-normal nil :background "#a6e22e")
(set-face-attribute 'spaceline-evil-replace nil :background "#f92672")
(set-face-attribute 'spaceline-evil-visual nil :background "#fd971f")

(spaceline-install
    `(
      ;; Init
((persp-name
            workspace-number
            window-number)
           :fallback evil-state
           :face highlight-face
           :priority 0)
      (anzu :priority 4)
      auto-compile
      ;; Extras
         '((buffer-modified buffer-size buffer-id remote-host)
           :priority 1)

      major-mode
      (process :when active)
      ((flycheck-error flycheck-warning flycheck-info)
       :when active
       :priority 3)
      (minor-modes :when active)
      (mu4e-alert-segment :when active)
      (erc-track :when active)
      (version-control :when active
                       :priority 7)
      (org-pomodoro :when active)
      (org-clock :when active)
      nyan-cat)
    `(which-function
      (python-pyvenv :fallback python-pyenv)
      purpose
      (battery :when active)
      (selection-info :priority 2)
      input-method
      ((buffer-encoding-abbrev
        point-position
        line-column)
       :separator " | "
       :priority 3)
      (global :when active)
      (buffer-position :priority 0)
      (hud :priority 0)))

(setq-default mode-line-format '("%e" (:eval (spaceline-ml-main))))
(provide 'init-theme)
