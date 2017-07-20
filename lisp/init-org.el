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

(after 'org
  (add-to-list 'org-modules 'org-habit)
)

(after 'org-agenda-mode
  (org-agenda-log-mode 1)
)

(provide 'init-org)
