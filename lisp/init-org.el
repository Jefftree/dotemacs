(setq org-ellipsis " …") ;; Shorter ellipses

(setq org-todo-keywords
        '((sequence "TODO(t)" "BLOCKED(b)" "NEXT(n)"
                    "|" "CANCELLED(c)" "DONE(x)")))

(setq org-adapt-indentation nil) ;; Prevent newline from indenting to bullet
(setq org-hide-leading-stars t) ;; Hide leading *** bullets to avoid clutter
(setq org-src-fontify-natively t) ;; Org Mode syntax highlighting minor mode
(setq org-fontify-done-headline t) ;; Different font for DONE headline

(setq org-default-notes-file (concat user-emacs-directory "notes.org"))
(setq org-log-done 'time) ;; Add timestamp when tasks are DONE

(setq org-agenda-span 7)
(setq org-agenda-custom-commands
      '(("n" "Actionable Items" todo "NEXT")
        ("W" "Weekly Review"
         ((agenda "" ((org-agenda-ndays 7))) ;; WIP
          (tags "+CLOSED>\"<-7d>\""
                ((org-agenda-overriding-header "Completed Last Week"))
                )
          (tags "LEVEL=3+TODO=\"NEXT\""
                ((org-agenda-overriding-header "Next Tasks"))
                ) ;;brap
          (tags "LEVEL=3+TODO=\"TODO\""
                ((org-agenda-overriding-header "High-priority unfinished tasks:"))
                )
          (tags "LEVEL=2+TODO=\"TODO\"" ((org-agenda-files '("~/Sync/workspace/assay/inbox.org"))
                                        (org-agenda-overriding-header "Inbox")
                                         ))
          (tags "LEVEL=3+TODO=\"TODO\"" ((org-agenda-files '("~/Sync/workspace/assay/backlog.org"))
                                        (org-agenda-overriding-header "Backlog")
                                         ))
          (todo "BLOCKED"))) ;; review blocked items
      ))

(after 'org
  (add-to-list 'org-modules 'org-habit)
)
(setq org-list-allow-alphabetical 1)

(after 'org-agenda-mode
  (org-agenda-log-mode 1)
)
(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10) ;; Speedy jumping
(setq org-outline-path-complete-in-steps nil) ;; Skip tree style navigation

;; Auto save after refile
(advice-add 'org-refile :after
        (lambda (&rest _)
        (org-save-all-org-buffers)))

(setq org-todo-keyword-faces
      (quote (("TODO" :foreground "#fc644d" :weight bold)
              ("NEXT" :foreground "#2dfffe" :weight bold)
              ("DONE" :foreground "#a8ff60" :weight bold)
              ("BLOCKED" :foreground "#a40073" :weight bold)
              ("CANCELLED" :foreground "#29fd2d" :weight bold)
              )))

(setq org-agenda-files '("~/Sync/workspace/assay/inbox.org"
                         "~/Sync/workspace/assay/todo.org"
                         "~/Sync/workspace/assay/tickler.org"))

(setq org-refile-targets '(("~/Sync/workspace/assay/todo.org" :maxlevel . 2)
                           ("~/Sync/workspace/assay/tickler.org" :maxlevel . 1)
                           ("~/Sync/workspace/assay/backlog.org" :maxlevel . 1)))

(setq org-capture-templates '(("c" "Inbox" entry
                               (file+headline "~/Sync/workspace/assay/inbox.org" "Tasks")
                               "* TODO %i%?")
                              ("t" "Tickler" entry
                               (file+headline "~/Sync/workspace/assay/tickler.org" "Tickler")
                               "* %i%? \nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))")))

;; Evaluating Python Code Blocks in org
(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (C . t)
   ))

(setq org-tag-alist '(("@work" . ?w)
                      ("@home" . ?h)
                      ("laptop" . ?l)
                      ("internet", ?i)
                      ("phone", ?p)))

(provide 'init-org)
