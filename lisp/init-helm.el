(require-package 'helm)
(require 'helm-config)

(add-hook 'after-init-hook #'helm-mode)

(setq helm-autoresize-min-height 30)
(setq helm-autoresize-max-height 30)
(setq helm-autoresize-mode nil)

(setq helm-buffer-max-length 40)

(setq helm-ff-tramp-not-fancy nil)

(require-package 'helm-flx)
(after 'helm-mode #'helm-fix-mode)

(require-package 'helm-fuzzier)
(after 'helm-mode #'helm-fuzzier-mode)

(after 'grep
    (add-to-list 'grep-find-ignored-directories "vendor"))

(require-package 'helm-ag)
(setq helm-ag-fuzzy-match t)
(setq helm-ag-use-grep-ignore-list t)


(setq helm-M-x-fuzzy-match t)
(setq helm-buffers-fuzzy-matching t)
(setq helm-recentf-fuzzy-match t)
(setq helm-imenu-fuzzy-match t)

; Use other window for splits
(setq helm-split-window-inside-p nil)
(setq helm-split-window-default-side 'right)

(require-package 'helm-swoop)
(setq helm-swoop-pre-input-function #'ignore)
(setq helm-swoop-use-fuzzy-match t)
(setq helm-swoop-use-line-number-face t)
(setq helm-swoop-speed-or-color t)

;; Shorten window height and remove the [C-j] blob
(setq helm-display-header-line nil)
;; (after 'helm-mode (set-face-attribute 'helm-source-header nil :height 0.1))

;; Multiline annoyance
(setq helm-projectile-truncate-lines t)

(setq helm-follow-mode-persistent 1)
(setq helm-source-names-using-follow '("Search at ~/.emacs.d/" "Helm Xref"))

(require-package 'projectile)

(setq projectile-cache-file (concat dotemacs-cache-directory "projectile.cache"))
(setq projectile-known-projects-file (concat dotemacs-cache-directory "projectile-bookmarks.eld"))

(setq projectile-completion-system 'helm)

(setq projectile-switch-project-action 'helm-projectile)
(setq projectile-use-git-grep 1)
(setq projectile-enable-caching t)
(setq projectile-file-exists-remote-cache nil)

(setq projectile-globally-ignored-files '("TAGS" "*.o"))
(setq projectile-project-search-path '("~/workspace/"))

(add-hook 'after-init-hook #'projectile-mode)

(require-package 'helm-projectile)
(after 'projectile
  (helm-projectile-on))


(provide 'init-helm)
