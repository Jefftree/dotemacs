(setq org-ellipsis " …") ;; Shorter ellipses

(setq org-todo-keywords
        '((sequence "TODO(t)" "BLOCKED(b)" "STARTED(s)"
                    "|" "CANCELLED(c)" "DONE(x)")))

(setq org-adapt-indentation nil) ;; Prevent newline from indenting to bullet
(setq org-hide-leading-stars t) ;; Hide leading *** bullets to avoid clutter
(setq org-src-fontify-natively t) ;; Org Mode syntax highlighting minor mode


(setq org-default-notes-file (concat user-emacs-directory "notes.org"))
(setq org-log-done 'time) ;; Add timestamp when tasks are DONE

(setq org-agenda-span 7)

(after 'org
  (org-agenda-log-mode 1)
  (add-to-list 'org-modules 'org-habit)
)

(provide 'init-org)
