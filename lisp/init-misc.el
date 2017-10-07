(require-package 'markdown-mode)
(setq markdown-command "multimarkdown")
(setq markdown-enable-math 1)

(setq js-indent-level 2) ; Javscript indentation: 2

;; iPython interpreter
(setq python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt -i")

;; Highlight latex math
(setq org-highlight-latex-and-related '(latex script entities))

(require-package 'neotree)
(require 'neotree)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(require-package 'restart-emacs)
(require-package 'lua-mode)
(require-package 'yaml-mode)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

(provide 'init-misc)
