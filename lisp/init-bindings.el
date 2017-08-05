(require-package 'which-key)
(setq which-key-idle-delay 0.8)
(setq which-key-min-display-lines 3)
(which-key-mode)

;; Define & add to which key. Reference: github.com/bling/dotemacs
(defmacro -define-key (keymap sequence binding &optional description)
  (declare (indent defun))
  `(progn
     (define-key ,keymap (kbd ,sequence) ,binding)
     (when ,description
       (which-key-add-key-based-replacements ,sequence ,description))))

(defmacro -define-keys (keymap &rest body)
  (declare (indent defun))
  `(progn
     ,@(cl-loop for binding in body
                collect `(let ((seq ,(car binding))
                               (func ,(cadr binding))
                               (desc ,(caddr binding)))
                           (-define-key ,keymap seq func desc)))))

(require-package 'key-chord)
(key-chord-mode 1)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-insert-state-map "nh" 'evil-normal-state)

(after 'evil-magit
  (-define-keys magit-blame-mode-map
    ("<tab>" 'magit-show-commit)
    ("n" 'evil-search-next)
  )
)

(-define-keys evil-normal-state-map
    ("Y" "y$")
    ("C-c w" 'save-buffer)
    ("C-c x" 'evil-save-modified-and-close)
    ("C-c X" 'kill-buffer)
    ("C-c v" (kbd "C-w v C-w l") "vsplit")
    ("C-c s" (kbd "C-w s C-w j") "ssplit")

    ("j" 'evil-next-visual-line)
    ("k" 'evil-previous-visual-line)
    ("g p" "`[v`]" "evil-goto-paste")

    ("[ e" "ddkP")
    ("] e" "ddp")
    ("[ b" 'previous-buffer)
    ("] b" 'next-buffer)
    ("[ q" 'previous-error)
    ("] q" 'next-error)
)

(defun cry ()
  "There are better ways to move around!"
  (interactive)
  (message "¯\\_(ツ)_//¯")
 )

;; (-define-keys evil-normal-state-map
;;     ("h" 'cry)
;;     ("j" 'cry)
;;     ("k" 'cry)
;;     ("l" 'cry)
;; )

(-define-keys evil-insert-state-map
  ("C-g" 'evil-normal-state)
  ("C-e" 'evil-end-of-line)
  ("C-a" 'evil-first-non-blank)
)

(-define-keys evil-motion-state-map
  ("M-h" 'evil-window-left)
  ("M-j" 'evil-window-down)
  ("M-k" 'evil-window-up)
  ("M-l" 'evil-window-right)
  ("M-o" 'evil-window-rotate-downwards)
)

(-define-keys evil-normal-state-map
  ("SPC f" 'my-helm-hydra/body)
  ("SPC w" 'my-window-hydra/body)
  ("SPC a" 'my-org-hydra/body)
  ("SPC b" 'my-buffer-hydra/body)
  ("SPC t" 'my-toggle-hydra/body)
  ("SPC j" 'my-jump-hydra/body)
  ("SPC g" 'my-git-hydra/body)
  ("SPC c" 'my-colemak-hydra/body)
  ("SPC e" 'eshell)
  ("SPC r" 'eval-buffer)
  ("SPC k" 'helm-colors)
  ("SPC SPC" 'helm-M-x)
  ("SPC Q" (lambda () (interactive) (restart-emacs '("--debug-init"))))
)

;; Rules are meant to be broken
;; Partially restore up/down navigation in Colemak
(-define-keys evil-normal-state-map
  ("k" 'evil-search-next)
  ("K" 'evil-search-previous)
  ("n" 'evil-next-visual-line)
  ("e" 'evil-previous-visual-line)
  ("j" 'evil-forward-word-end)
)

(-define-keys evil-normal-state-map
  ("C-c ," 'avy-goto-word-2)
  ("C-c ." 'avy-goto-char-2)
  ("SPC i" 'neotree-toggle))

(-define-keys evil-motion-state-map
  ("k" 'evil-search-next)
  ("K" 'evil-search-previous)
  ("n" 'evil-next-line)
  ("e" 'evil-previous-line))

(define-key global-map (kbd "C-<backspace>") 'keyboard-quit)

(define-key global-map (kbd "C-=") 'text-scale-increase)
(define-key global-map (kbd "C--") 'text-scale-decrease)

(after 'helm
  (global-set-key [remap execute-extended-command] #'helm-M-x)
)

(add-hook 'eshell-mode-hook
    (lambda ()
        (local-set-key (kbd "M-h") #'evil-window-left)
        (local-set-key (kbd "M-j") #'evil-window-down)
        (local-set-key (kbd "M-k") #'evil-window-up)
        (local-set-key (kbd "M-l") #'evil-window-right)))

(defun simulate-key-press (key)
  "Pretend that KEY was pressed.
KEY must be given in `kbd' notation."
  `(lambda ()
     (interactive)
     (setq prefix-arg current-prefix-arg)
     (setq unread-command-events (listify-key-sequence (read-kbd-macro ,key)))))

(define-key evil-normal-state-map (kbd ",") (simulate-key-press "C-c"))

(provide 'init-bindings)
