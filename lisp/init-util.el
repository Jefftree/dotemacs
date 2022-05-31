(require 'desktop)
(setq desktop-dirname dotemacs-cache-directory)
(add-to-list 'desktop-path dotemacs-cache-directory)

;; (desktop-save-mode 1)

(if (display-graphic-p)
    (progn
      (require-package 'git-gutter-fringe)
      (require 'git-gutter-fringe)
      (require-package 'git-gutter)
      (require 'git-gutter)
      (global-git-gutter-mode)
    )
)

  ;; places the git gutter outside the margins.
  ;; Reference: https://github.com/hlissner/.emacs.d
(after 'git-gutter-fringe
      (setq-default fringes-outside-margins t)
      (defvar line-bitmap [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224])
      (defvar deleted-bitmap [0 0 0 0 0 0 0 0 0 0 0 0 0 128 192 224 240 248])
      (define-fringe-bitmap 'git-gutter-fr:added line-bitmap nil 2 'center)
      (define-fringe-bitmap 'git-gutter-fr:modified line-bitmap nil 2 'center)
      (define-fringe-bitmap 'git-gutter-fr:deleted deleted-bitmap nil 2 'center))

(require-package 'color-identifiers-mode)
(add-hook 'after-init-hook #'global-color-identifiers-mode)

; Save window configs (C-c <left>)
(add-hook 'after-init-hook #'winner-mode)

(require-package 'dumb-jump)
(setq dumb-jump-selector 'helm)
(setq dumb-jump-prefer-searcher 'ag)
(setq dumb-jump-max-find-time 6)

(require-package 'avy)
(require 'avy)

(require-package 'ein)
(require 'ein)

; (require-package 'autopair)
; (require 'autopair)
; (autopair-global-mode)

(provide 'init-util)
