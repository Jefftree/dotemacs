(require-package 'xterm-color)
(require 'xterm-color)

(add-hook 'comint-preoutput-filter-functions #'xterm-color-filter)
(setq comint-output-filter-functions (remove #'ansi-color-process-output comint-output-filter-functions))

(after 'eshell-mode
  (add-to-list 'eshell-preoutput-filter-functions #'xterm-color-filter)
  (add-hook 'eshell-mode-hook
            (lambda ()
              (setenv "TERM" "xterm-256color")
              (setq xterm-color-preserve-properties t))))

(setq eshell-prompt-function
  (lambda ()
    (concat
      (propertize (abbreviate-file-name (eshell/pwd)) 'face 'font-lock-builtin-face)
      (propertize " ❯" 'face 'eshell-ls-archive)
      (propertize "❯" 'face 'eshell-ls-directory)
      (propertize " " 'face 'font-lock-preprocessor-face)
)))

(provide 'init-eshell)
