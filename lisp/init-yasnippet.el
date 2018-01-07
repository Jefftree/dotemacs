(require-package 'yasnippet)

(require 'yasnippet)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'org-mode-hook #'yas-minor-mode)
(yas-load-directory (concat user-emacs-directory "/snippets"))

(provide 'init-yasnippet)
