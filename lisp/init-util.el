(require 'desktop)
(setq desktop-dirname dotemacs-cache-directory)
(add-to-list 'desktop-path dotemacs-cache-directory)

;; (desktop-save-mode 1)

(if (display-graphic-p)
    (progn
      (require-package 'git-gutter-fringe)
      (require 'git-gutter-fringe)
      (require-package 'git-gutter)
      (require 'git-gutter)
      (global-git-gutter-mode)
    )
)

  ;; places the git gutter outside the margins.
  ;; Reference: https://github.com/hlissner/.emacs.d
(after 'git-gutter-fringe
      (setq-default fringes-outside-margins t)
      (defvar line-bitmap [224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224 224])
      (defvar deleted-bitmap [0 0 0 0 0 0 0 0 0 0 0 0 0 128 192 224 240 248])
      (define-fringe-bitmap 'git-gutter-fr:added line-bitmap nil 2 'center)
      (define-fringe-bitmap 'git-gutter-fr:modified line-bitmap nil 2 'center)
      (define-fringe-bitmap 'git-gutter-fr:deleted deleted-bitmap nil 2 'center))
(require-package 'color-identifiers-mode)
(add-hook 'after-init-hook #'global-color-identifiers-mode)

; Save window configs (C-c <left>)
(add-hook 'after-init-hook #'winner-mode)

(require-package 'yasnippet)

(require 'yasnippet)
(add-hook 'prog-mode-hook #'yas-minor-mode)
(add-hook 'org-mode-hook #'yas-minor-mode)
(yas-load-directory (concat user-emacs-directory "/snippets"))


(require-package 'dumb-jump)
(setq dumb-jump-selector 'helm)

(require-package 'avy)
(require 'avy)
(defun avy-goto-word-2 (char1 char2 &optional arg beg end symbol)
  "Jump to the currently visible CHAR1 at a word starting with CHAR1 CHAR2.
The window scope is determined by `avy-all-windows' (ARG negates it)."
  (interactive (list (read-char "char 1: " t)
                     (read-char "char 2: " t)
                     current-prefix-arg))
  (avy-with avy-goto-word-2
    (let* ((str1 (string char1))
           (str2 (string char2))
           (regex1 (cond ((string= str1 ".")
                         "\\.")
                        ((and avy-word-punc-regexp
                              (string-match avy-word-punc-regexp str1))
                         (regexp-quote str1))
                        ((<= char1 26)
                         str1)
                        (t
                         (concat
                          (if symbol "\\_<" "\\b")
                          str1))))
           (regex2 (cond ((string= str2 ".")
                         "\\.")
                        ((and avy-word-punc-regexp
                              (string-match avy-word-punc-regexp str2))
                         (regexp-quote str2))
                        ((<= char2 26)
                         str2)
                        (t
                         str2)))
           (regex (concat regex1 regex2)))
      (avy--generic-jump regex arg avy-style beg end))))

(provide 'init-util)
