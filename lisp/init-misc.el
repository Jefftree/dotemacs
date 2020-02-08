(require-package 'markdown-mode)
(setq markdown-command "multimarkdown")
(setq markdown-enable-math 1)

(setq js-indent-level 2) ; Javscript indentation: 2

(require-package 'go-mode)

(require-package 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)
;; (add-hook 'emacs-lisp-mode-hook #'lsp-deferred)

(require-package 'lsp-ui)
(require 'lsp-ui)
(add-hook 'lsp-mode-hook 'lsp-ui-mode)
(setq lsp-ui-peek-enable 1)
(setq lsp-ui-peek-list-width 60)
(setq lsp-ui-peek-peek-height 40)

(setq lsp-clients-go-library-directories '("/usr/lib"))

(require-package 'treemacs)

(require-package 'treemacs-projectile)

(setq treemacs-is-never-other-window t)

(require-package 'lsp-treemacs)

(lsp-treemacs-sync-mode 1)



(setq python-shell-interpreter "ipython2"
    python-shell-interpreter-args "--simple-prompt -i")

;; lua tabs
(setq lua-indent-level 2)

(add-to-list 'auto-mode-alist '("\\.bazel\\'" . bazel-mode))
(add-to-list 'auto-mode-alist '("\\BUILD\\'" . bazel-mode))

(require-package 'dired-subtree)
(require 'dired-subtree)

;; Directories before files in dired
(setq dired-listing-switches "-lXGh --group-directories-first")

(require-package 'restart-emacs)
(require-package 'lua-mode)
(require-package 'yaml-mode)

(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq ediff-split-window-function #'split-window-horizontally)

;; (defun dedicate-window-pls nil
;;   (interactive)
;;   (set-window-parameter (selected-window) 'no-other-window t))

;; (add-hook 'ediff-mode-hook #'dedicate-window-pls)

(provide 'init-misc)
