(require-package 'hydra)

(defhydra my-git-hydra (:hint nil :exit t)
  "
   magit:  _s_ → status  _l_ → log    _f_ → file \
   staging:  _a_ → +hunk  _A_ → +buffer
           _c_ → commit  _d_ → diff   _r_ → pull \
             _r_ → -hunk  _R_ → -buffer
           _p_ → push    _b_ → blame
  "
  ("s" magit-status)
  ("b" magit-blame-popup)
  ("f" magit-file-popup)
  ;("z" magit-stash-popup)
  ("l" magit-log-popup)
  ("d" magit-diff-popup)
  ("c" magit-commit-popup)
  ("p" magit-push-popup)
  ("r" magit-pull-popup)

  ("a" git-gutter+-stage-hunks)
  ("r" git-gutter+-revert-hunk)
  ("A" git-gutter+-stage-whole-buffer)
  ("R" git-gutter+-unstage-whole-buffer)
)


(defhydra my-jump-hydra (:hint nil :exit t)
  "
   jump   _i_ → imenu   _k_ → swoop
          _l_ → multi swoop
"
  ("i" helm-semantic-or-imenu)
  ("k" helm-swoop)
  ("l" helm-multi-swoop-all)
)

;; TODO: Establish naming convention
(defun switch-to-projects nil
    (interactive)
    (helm-find-files-1 (expand-file-name "~/workspace/")))

(defhydra my-helm-hydra (:hint nil :exit t)
  "
   search:   _a_ → apropos   _y_ → kill-ring   _s_ → ag
             _e_ → mini      _p_ → projectile  _f_ → pf
             _d_ → imenu     _o_ → switch      _l_ → files
             _v_ → resume

  "
  ("a" helm-apropos)
  ("i" switch-to-projects)
  ("s" helm-projectile-ag)
  ("e" helm-mini)
  ("f" helm-projectile-find-file)
  ("d" helm-imenu)
  ("l" helm-find-files)
  ("p" helm-projectile)
  ("o" helm-projectile-switch-project)
  ("v" helm-resume)
  ("y" helm-show-kill-ring)
)


(defhydra my-toggle-hydra (:hint nil :exit t)
  "
   toggle:  _t_ → truncate lines    _w_ → whitespace    _r_ → rainbow
            _c_ → company           _l_ → linum
"
  ("c" company-mode)
  ("t" toggle-truncate-lines)
  ("s" flycheck-mode)
  ("w" whitespace-mode)
  ("r" rainbow-mode)
  ("l" nlinum-mode)
)

(defhydra my-colemak-hydra (:hint nil :exit t)
  "
                                                                            Q W F P G J L U Y ; [ ]
                                                                             A R S T D H N E I O '
                                                                              Z X C V B K M , . /
  "
)


(defhydra my-org-hydra (:hint nil :exit t)
  "
   toggle:  _a_ → agenda
  "
  ("a" org-agenda)

)

(provide 'init-hydra)
