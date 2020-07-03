(require-package 'hydra)


(defun jefftree-ediff nil
  (interactive)
  (require 'magit-ediff)
  (apply 'magit-ediff-compare "master" nil
         (magit-ediff-read-files "master" nil))
  )

(defhydra my-git-hydra (:hint nil :exit t :idle 0.5)
  "
   magit:  _s_ → status  _l_ → log    _f_ → file \
   staging:  _a_ → +hunk  _A_ → +buffer
           _c_ → commit  _d_ → diff   _r_ → pull \
             _r_ → -hunk  _R_ → -buffer
           _p_ → push    _b_ → blame
  "
  ("s" magit-status)
  ("b" magit-blame)
  ("e" jefftree-ediff)

  ;; Broken
  ("f" magit-file-popup)
  ("z" magit-stash-popup)
  ("l" magit-log-popup)
  ("d" magit-diff-popup)
  ("c" magit-commit-popup)
  ("p" magit-push-popup)
  ("r" magit-pull-popup)

  ("a" git-gutter:stage-hunk)
  ("r" git-gutter:revert-hunk)
  ("A" git-gutter:stage-whole-buffer)
  ("R" git-gutter:unstage-whole-buffer)
)



(defun lsp-goto-first-ref nil
  (interactive)
  (lsp-ui-peek-find-references)
  (lsp-ui-peek--select-next)
  (lsp-ui-peek--goto-xref)
)

(defhydra my-jump-hydra (:hint nil :exit t :idle 0.5)
  "
   jump   _i_ → imenu   _k_ → swoop   _c_ → avy char
          _t_ → def     _d_ → 1st-ref     _o_ → def-other-window
          _l_ → multi   _s_ → ref
  "
  ("i" helm-semantic-or-imenu)
  ("k" helm-swoop)
  ("l" helm-multi-swoop-all)
  ("c" avy-goto-char)
  ("r" helm-jedi-related-names)
  ("t" xref-find-definitions)
  ("d" lsp-goto-first-ref)
  ("s" lsp-goto-type-definition)
  ("o" xref-find-definitions-other-window)
)

;; TODO: Establish naming convention
(defun switch-to-projects nil
    (interactive)
    (helm-find-files-1 (expand-file-name "~/workspace/")))

(defhydra my-helm-hydra (:hint nil :exit t :idle 0.5)
  "
   search:   _h_ → apropos   _y_ → kill-ring   _s_ → ag    _m_ → mark-ring
             _e_ → mini      _v_ → resume      _f_ → pf
             _d_ → imenu     _o_ → switch      _l_ → files

  "
  ("h" helm-apropos)
  ("i" switch-to-projects)
  ("s" helm-projectile-ag)
  ("g" helm-projectile-grep)
  ("e" helm-mini)
  ("f" helm-projectile)
  ("d" helm-imenu)
  ("l" helm-find-files)
  ("o" helm-projectile-switch-project)
  ("v" helm-resume)
  ("y" helm-show-kill-ring)
  ("m" helm-mark-ring)
)


(defun toggle-frame-split ()
  "If the frame is split vertically, split it horizontally or vice versa.
Assumes that the frame is only split into two."
  (interactive)
  (unless (= (length (window-list)) 2) (error "Can only toggle a frame split in two"))
  (let ((split-vertically-p (window-combined-p)))
    (delete-window) ; closes current window
    (if split-vertically-p
        (split-window-horizontally)
      (split-window-vertically)) ; gives us a split with the other window twice
    (switch-to-buffer nil))) ; restore the original window in this part of the frame

(defhydra my-toggle-hydra (:hint nil :exit t :idle 0.5)
  "
   toggle:  _t_ → truncate lines    _w_ → whitespace    _r_ → rainbow
            _c_ → company           _l_ → linum
"
  ("c" company-mode)
  ("t" toggle-truncate-lines)
  ("s" flycheck-mode)
  ("w" whitespace-mode)
  ("r" color-identifiers-mode)
  ("l" nlinum-mode)
  ("v" toggle-frame-split)
)

(defun jefftree--kill-this-buffer nil
  (interactive)
  (kill-buffer (current-buffer))
)

(defhydra my-buffer-hydra (:exit t :idle 0.5)
  ("k" jefftree--kill-this-buffer "kill buffer")
  ("p" switch-to-prev-buffer "prev buffer" :color red)
  ("n" switch-to-next-buffer "next buffer" :color red)
)

(defhydra my-peace-hydra (:exit t :idle 0.5)
  ("q" jefftree--kill-this-buffer "kill buffer")
)

(defun jefftree--open-todo nil
  (interactive)
  (find-file "~/Sync/ro/assay/todo.org")
)

(defun jefftree--open-tickler nil
  (interactive)
  (find-file "~/Sync/ro/assay/tickler.org")
)

(defun jefftree--open-inbox nil
  (interactive)
  (find-file "~/Sync/ro/assay/inbox.org")
)

(defun jefftree--open-notes nil
  (interactive)
  (find-file "~/Sync/ro/notes/global.org")
)

(defun jefftree--open-backlog nil
  (interactive)
  (find-file "~/Sync/ro/assay/backlog.org")
)

(defun jefftree/config/open-init nil
  (interactive)
  (find-file "~/.emacs.d/init.el")
)

(defun org-sparse-next nil
  (interactive)
  (org-show-todo-tree 3)
)

(defun jefftree/config/ff nil
  (interactive)
  (helm-projectile-find-file (expand-file-name "~/.emacs.d"))
)

(defhydra my-config-hydra (:hint nil :exit t :idle 0.5)
  ("a" jefftree/config/open-init "init")
  ("f" jefftree/config/ff "ff")
)

(defhydra my-org-hydra (:hint nil :exit t :idle 0.5)
  ("a" org-agenda "agenda")
  ("q" org-sparse-next "next")
  ("c" org-capture "capture")
  ("t" jefftree--open-todo "todo")
  ("r" jefftree--open-tickler "tickler")
  ("b" jefftree--open-backlog "backlog")
  ("i" jefftree--open-inbox "inbox")
  ("n" jefftree--open-notes "notes")
  ("s" (lambda () (interactive) (switch-to-buffer "*scratch*")) "scratch")
)

(defhydra my-window-hydra (:hint nil :exit t :idle 0.5)
  ("p" winner-undo "undo" :color red)
  ("s" window-configuration-to-register "save")
  ("r" jump-to-register "load")
  ("n" winner-redo "redo")
  ("+" evil-window-increase-height "+" :color red)
  ("-" evil-window-decrease-height "-" :color red)
  (">" evil-window-increase-width ">" :color red)
  ("<" evil-window-decrease-width "<" :color red)
)

(defun connect-to-localhost nil
  (interactive)
  (ein:notebooklist-open "localhost:8888")
)

(defhydra my-notebook-hydra (:hint nil :exit t :idle 0.5)
  ("c" connect-to-localhost "notebook-open")
)

(defhydra my-colemak-hydra (:hint nil :exit t :idle 0.5)
  "
                                                                            Q W F P G J L U Y ; [ ]
                                                                             A R S T D H N E I O '
                                                                              Z X C V B K M , . /
  "
)


(provide 'init-hydra)
