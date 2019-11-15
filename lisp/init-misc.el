(require-package 'markdown-mode)
(setq markdown-command "multimarkdown")
(setq markdown-enable-math 1)

(setq js-indent-level 2) ; Javscript indentation: 2

;; iPython interpreter
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

(provide 'init-misc)
