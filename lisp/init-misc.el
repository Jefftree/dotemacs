(require-package 'markdown-mode)
(setq markdown-command "multimarkdown")
(setq markdown-enable-math 1)

(setq js-indent-level 2) ; Javscript indentation: 2
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

(when noninteractive
  (after! undo-tree
    (global-undo-tree-mode -1)))

(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))

(setq helm-ag-ignore-patterns '("swagger.json" "*zz_generated.*" "*.md" "*.json" "*generated.proto" "*generated.pb.go"))


(require-package 'go-mode)

(require-package 'gotest)

(defun foo ()
(define-key go-mode-map (kbd "C-x f") 'go-test-current-file)
(define-key go-mode-map (kbd "C-x t") 'go-test-current-test))

(require-package 'lsp-mode)
(add-hook 'go-mode-hook #'lsp-deferred)
(add-hook 'go-mode-hook #'foo)
(add-hook 'python-mode-hook #'lsp-deferred)

(require-package 'helm-lsp)

(after 'lsp-mode (lsp-register-custom-settings
 '(("gopls.allowImplicitNetworkAccess" t t)
   )))

(after 'lsp-mode
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]_output\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]testdata\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.yaml\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.json\\'")

  (setq lsp-enable-file-watchers t)
  (setq lsp-file-watch-threshold 10000)
  )

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t)
  )
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; (add-hook 'emacs-lisp-mode-hook #'lsp-deferred)

(require-package 'lsp-ui)
(require 'lsp-ui)

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

;;use larger font
;; (setq default-frame-alist '((font . "Consolas-20")))

(require-package 'eglot)

(require-package 'yafolding)
(add-hook 'js-mode-hook #'hs-minor-mode)


(setq hs-hide-all-non-comment-function #'ignore)
(provide 'init-misc)
