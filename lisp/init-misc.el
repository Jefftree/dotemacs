(require-package 'markdown-mode)
(setq markdown-command "multimarkdown")
(setq markdown-enable-math 1)

(setq js-indent-level 2) ; Javscript indentation: 2
(global-undo-tree-mode)
(evil-set-undo-system 'undo-tree)

(when noninteractive
  (after! undo-tree
    (global-undo-tree-mode -1)))

(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/.undo")))

(setq helm-ag-ignore-patterns '("swagger.json" "*zz_generated.*" "*.md" "*.json" "*generated.proto" "*generated.pb.go"))


(require-package 'go-mode)

(require-package 'gotest)

(defun foo ()
(define-key go-mode-map (kbd "C-x f") 'go-test-current-file)
(define-key go-mode-map (kbd "C-x t") 'go-test-current-test)
(define-key go-mode-map (kbd "C-x b") 'go-test-current-benchmark))

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
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]vendor\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]testdata\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.yaml\\'")
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]\\.json\\'")

  (setq lsp-enable-file-watchers t)
  (setq lsp-file-watch-threshold 10000)
  )

(require-package 'dap-mode)
(require 'dap-dlv-go)
(after 'dap-mode
  (setq dap-auto-configure-features
   '(sessions locals breakpoints expressions tooltip))
    )

(after 'dap-ui
  (setq dap-ui-buffer-configurations
        `((,dap-ui--locals-buffer . ((side . right) (slot . 1) (window-width . 0.20)))
          (,dap-ui--expressions-buffer . ((side . right) (slot . 2) (window-width . 0.20)))
          (,dap-ui--sessions-buffer . ((side . right) (slot . 3) (window-width . 0.20)))
          (,dap-ui--breakpoints-buffer . ((side . left) (slot . 2) (window-width . ,treemacs-width)))
          (,dap-ui--debug-window-buffer . ((side . bottom) (slot . 3) (window-width . 0.20)))
          (,dap-ui--repl-buffer . ((side . right) (slot . 2) (window-width . 0.45))))))

(add-to-list 'display-buffer-alist '(".+server log\\*\\'" display-buffer-no-window))
(add-to-list 'display-buffer-alist '("\\*eshell" display-buffer-in-side-window
      (side . bottom)
      (slot . -1)
      (window-parameters . ((no-other-window . t)))))

(require-package 'iedit)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  ;; (add-hook 'before-save-hook #'lsp-format-buffer t t)
  ;; (add-hook 'before-save-hook #'lsp-organize-imports t t)
  )
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; (add-hook 'emacs-lisp-mode-hook #'lsp-deferred)
(require-package 'lsp-ui)
(require 'lsp-ui)
;; (setq lsp-ui-sideline-show-hover t)

(setq lsp-clients-go-library-directories '("/usr/local/go"))

(require-package 'helm-xref)

(setq python-shell-interpreter "ipython2"
    python-shell-interpreter-args "--simple-prompt -i")

;; lua tabs
(setq lua-indent-level 2)

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

(add-hook 'js-mode-hook #'hs-minor-mode)


(setq hs-hide-all-non-comment-function #'ignore)
(provide 'init-misc)
