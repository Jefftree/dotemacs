(setq eshell-aliases-file (concat user-emacs-directory ".alias"))
(setq eshell-buffer-maximum-lines 10000)
(setq eshell-glob-case-insensitive t)
(setq eshell-banner-message "")

(add-hook 'eshell-mode-hook
          (lambda () (setq-local global-hl-line-mode nil)))

;; NOTE: This must be modified if we change the prompt style
(setq eshell-prompt-regexp "^[^#$]* ❯❯ ")

(setq eshell-prompt-function
  (lambda ()
    (concat
      (propertize (abbreviate-file-name (eshell/pwd)) 'face 'font-lock-builtin-face)
      (propertize " ❯" 'face 'eshell-ls-archive)
      (propertize "❯" 'face 'eshell-ls-directory)
      (propertize " " 'face 'default)
)))

(defun eshell/ff (&rest args)
  "Opens a file in emacs."
  (when (not (null args))
    (find-file (car args))))

(defun eshell/fo (&rest args)
  "Opens a file in emacs."
  (when (not (null args))
    (find-file-other-window (car args))))

(provide 'init-eshell)
