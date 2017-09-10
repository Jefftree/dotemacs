(require-package 'markdown-mode)
(setq markdown-command "multimarkdown")
(setq markdown-enable-math 1)

(setq js-indent-level 2) ; Javscript indentation: 2

(setq python-shell-interpreter "ipython"
    python-shell-interpreter-args "--simple-prompt -i")

(require-package 'neotree)
(require 'neotree)

(setq neo-theme (if (display-graphic-p) 'icons 'arrow))

(require-package 'restart-emacs)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)

(require-package 'yasnippet)

(require 'yasnippet)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'org-mode-hook #'yas-minor-mode)
(yas-load-directory (concat user-emacs-directory "/snippets"))

(setq bookmark-default-file (concat dotemacs-cache-directory "bookmarks"))

(provide 'init-misc)
