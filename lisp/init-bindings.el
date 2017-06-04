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

(-define-keys magit-blame-mode-map
  ("<tab>" 'magit-show-commit)
  ("n" 'evil-search-next)
)

(-define-keys evil-normal-state-map
    ("Y" "y$")
    (", w" 'save-buffer)
    (", x" 'evil-save-modified-and-close)
    (", v" (kbd "C-w v C-w l") "vsplit")
    (", s" (kbd "C-w s C-w j") "ssplit")

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

(-define-keys evil-insert-state-map
  ("C-g" 'evil-normal-state)
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
  ("SPC t" 'my-toggle-hydra/body)
  ("SPC j" 'my-jump-hydra/body)
  ("SPC g" 'my-git-hydra/body)
  ("SPC e" 'eshell)
  ("SPC r" 'eval-buffer)
  ("SPC SPC" 'helm-M-x)
)

(-define-keys evil-normal-state-map
  ("SPC i" 'neotree-toggle))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'eshell-mode-hook
    (lambda ()
        (local-set-key (kbd "M-h") #'evil-window-left)
        (local-set-key (kbd "M-j") #'evil-window-down)
        (local-set-key (kbd "M-k") #'evil-window-up)
        (local-set-key (kbd "M-l") #'evil-window-right)))

(provide 'init-bindings)
